import 'package:aurora_finance/app/shared/enums/date_picker_format.dart';
import 'package:aurora_finance/app/view/widgets/UI/card_widget.dart';
import 'package:aurora_finance/app/view/widgets/UI/custom_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/enums/transaction_categories.dart';
import 'package:aurora_finance/app/view/widgets/UI/custom_dropdown_widget.dart';
import 'package:aurora_finance/app/view/widgets/UI/date_picker_widget.dart';
import 'package:aurora_finance/app/view/widgets/UI/custom_button_widget.dart';
import 'package:intl/intl.dart';
  
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

  @override
  void initState() {
    super.initState();

    void updateDisabled() {
      // TODO: implement updateDisabled
    }
    _amountController.addListener(updateDisabled);
    _dateController.addListener(updateDisabled);
    _descriptionController.addListener(updateDisabled);
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
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
                    _dateController.text = DateFormat('MMMM yyyy').format(date);
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
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: CustomButtonWidget(
            child: Text('Save'),
            width: double.infinity,
            onPressed: () {
              print('Save button pressed');
            },
          ),
        ),
      ],
    );
  }
}