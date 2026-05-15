import 'package:aurora_finance/app/entities/transaction.dart';
import 'package:aurora_finance/app/model_view/transactions/transactions_model_view.dart';
import 'package:aurora_finance/app/shared/enums/date_picker_format.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/widgets/UI/card_widget.dart';
import 'package:aurora_finance/app/view/widgets/UI/custom_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/enums/transaction_categories.dart';
import 'package:aurora_finance/app/view/widgets/UI/custom_dropdown_widget.dart';
import 'package:aurora_finance/app/view/widgets/UI/date_picker_widget.dart';
import 'package:aurora_finance/app/view/widgets/UI/custom_button_widget.dart';
import 'package:intl/intl.dart';
import 'package:aurora_finance/app/shared/utils/dialog_utils.dart';
  
class NewTransactionFormWidget extends StatefulWidget {
  const NewTransactionFormWidget({super.key});

  @override
  State<NewTransactionFormWidget> createState() => _NewTransactionFormWidgetState();
}

class _NewTransactionFormWidgetState extends State<NewTransactionFormWidget> {
  final _transactionFormKey = GlobalKey<FormState>();
  final List<String> _categories = ['Select a category', ...TransactionCategory.values.map((category) => category.name)];
  DateTime? _selectedDate;

  // Controllers
  String _movementType = '';
  String _category = 'Select a category';
  String _paymentMethod = 'Select a payment method';

  final _amountController = TextEditingController();
  final _dateController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool get _isDisabled => _movementType.isEmpty || _amountController.text.isEmpty || _descriptionController.text.isEmpty;
  late final _isDisabledNotifier = ValueNotifier(_isDisabled);

  Future<dynamic> _makeAnotherTransaction() {
    return DialogUtils.confirm(
      context: context,
      title: 'You save your transaction',
      message: 'Would you like to make another transaction?',
      confirmLabel: 'Yes',
      cancelLabel: 'No',
    );
  }
  
  Transaction _buildTransaction() {
    return Transaction(
      amount: double.parse(_amountController.text),
      description: _descriptionController.text,
      date: _selectedDate!,
      category: TransactionCategory.other,
      movementType: _movementType,
    );
  }

  Transaction _clearTransaction() {
    _amountController.clear();
    _dateController.clear();
    _descriptionController.clear();
    _movementType = '';
    _category = 'Select a category';
    _paymentMethod = 'Select a payment method';
    _selectedDate = null;
    return Transaction(
      amount: 0,
      description: '',
      date: DateTime.now(),
      category: TransactionCategory.other,
      movementType: '',
    );
  }

  void _saveTransaction(BuildContext context) {
    final transaction = _buildTransaction();
    switch(_movementType) {
      case 'income':
        TransactionsModelView().addIncomeTransaction(transaction);
        break;
      case 'expense':
        TransactionsModelView().addExpenseTransaction(transaction);
        break;
    }
  }

  @override
  void initState() {
    super.initState();

    void updateDisabled() {
      _isDisabledNotifier.value = _isDisabled;
    }
    _amountController.addListener(updateDisabled);
    _dateController.addListener(updateDisabled);
    _descriptionController.addListener(updateDisabled);
  }
  
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: TransactionsModelView(),
      builder: (context, child) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _transactionFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    CardWidget(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      child: Column(
                        children: [
                          Text(
                            'Amount (R\$)'.toUpperCase(),
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CustomInputWidget(
                            hintText: '0,00',
                            keyboardType: TextInputType.number,
                            hintStyle: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 32,
                            ),
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                            ),
                            textAlign: TextAlign.center,
                            border: Border.all(color: Colors.transparent),
                            controller: _amountController,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: SegmentedButton(
                        segments: [
                          ButtonSegment(
                            value: 'expense',
                            label: Text('Expense'),
                          ),
                          ButtonSegment(
                            value: 'income',
                            label: Text('Income'),
                          ),
                        ],
                        selected: {_movementType},
                        onSelectionChanged: (Set<String> selection) {
                          setState(() {
                            _movementType = selection.first;
                          });
                        },
                      ),
                    ),
                    if (_movementType == 'expense')
                      CustomDropdownWidget(
                        onChanged: (value) {
                          setState(() {
                            _category = value as String;
                          });
                        },
                        initialValue: _category,
                        items: _categories,
                        label: 'Category',
                      ),

                    if (_movementType != 'investment')
                      CustomDropdownWidget(
                        onChanged: (value) {
                          setState(() {
                            _paymentMethod = value as String;
                          });
                        },
                        initialValue: _paymentMethod,
                        items: ['Select a payment method', 'Credit Card', 'Debit Card', 'Pix'],
                        label: 'Payment Method',
                      ),
              
                    MonthPickerInput(
                      format: DatePickerFormat.fullDate,
                      labelText: 'Date',
                      initialDate: _selectedDate,
                      controller: _dateController,
                      onDateSelected: (date) {
                        setState(() {
                          _selectedDate = date;
                          _dateController.text = DateFormat('dd/MM/yyyy').format(date);
                        });
                      },
                    ),
              
                    CustomInputWidget(
                      controller: _descriptionController,
                      labelText: 'Description',
                    ),
                  ], 
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(16.0),
                color: Colors.white,
                child: ValueListenableBuilder(
                  valueListenable: _isDisabledNotifier,
                  builder: (context, value, child) {
                    return CustomButtonWidget(
                      backgroundColor: AppConfig.tertiarySwatch[300],
                      width: MediaQuery.of(context).size.width * 0.58,
                      onPressed: () async {
                        _saveTransaction(context);
                        bool makeAnotherTransaction = await _makeAnotherTransaction();
                        if (makeAnotherTransaction) {
                          _clearTransaction();
                        } else {
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        }
                      },
                      isDisabled: _isDisabled,
                      child: Text('Save Transaction'),
                    );
                  }
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}