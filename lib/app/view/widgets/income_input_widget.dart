import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/widgets/UI/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:aurora_finance/app/view/widgets/UI/date_picker_widget.dart';
import 'package:intl/intl.dart';
import 'package:aurora_finance/app/view/widgets/UI/custom_input_widget.dart';
import 'package:aurora_finance/app/model_view/settings/available_fund_model_view.dart';

class IncomeInputForm extends StatefulWidget {
  const IncomeInputForm({super.key});

  @override
  State<IncomeInputForm> createState() => _IncomeInputFormState();
}

class _IncomeInputFormState extends State<IncomeInputForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  
  // Controllers
  final _monthController = TextEditingController();
  final _incomeController = TextEditingController();
  final _billsController = TextEditingController();
  final AvailableFundModelView _availableFundModelView = AvailableFundModelView();

  // Methods
  Future<dynamic> _optionDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('You are saving your income'),
        content: Text('You have set your income to R\$${_incomeController.text}  and your fixed bills to R\$${_billsController.text}. Is that correct?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _monthController.text = '';
              _incomeController.text = '';
              _billsController.text = '';
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              _availableFundModelView.setExpectedIncome(double.parse(_incomeController.text));
              _availableFundModelView.setTotalFixedBills(double.parse(_billsController.text));
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  bool get _isDisabled => _monthController.text.isEmpty || _incomeController.text.isEmpty || _billsController.text.isEmpty;
  late final _isDisabledNotifier = ValueNotifier(_isDisabled);

  @override
  void initState() {
    super.initState();
    // Add listeners to update the notifier
    void updateDisabled() {
      _isDisabledNotifier.value = _isDisabled;
    }
    _monthController.addListener(updateDisabled);
    _incomeController.addListener(updateDisabled);
    _billsController.addListener(updateDisabled);
  }
  
  @override
  void dispose() {
    _monthController.dispose();
    _incomeController.dispose();
    _billsController.dispose();
    _isDisabledNotifier.dispose();  // ← Don't forget!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MonthPickerInput(
            labelText: 'Projection Month',
            initialDate: _selectedDate,
            controller: _monthController,
            onDateSelected: (date) {
              setState(() {
                _selectedDate = date;
                _monthController.text = DateFormat('MMMM yyyy').format(date);
              });
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Total Contracted Income'.toUpperCase(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          CustomInputWidget(
            controller: _incomeController,
            hintText: '\$0.00',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          Text(
            'Total Fixed Bills'.toUpperCase(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          CustomInputWidget(
            controller: _billsController,
            hintText: '\$0.00',
            keyboardType: TextInputType.number,
          ),

          const SizedBox(height: 16),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _isDisabledNotifier,
              builder: (context, value, child) {
                  return CustomButtonWidget(
                  backgroundColor: AppConfig.primarySwatch[400],
                  width: double.infinity,
                  onPressed: () {              
                    _optionDialog(context);
                  },
                  isDisabled: _isDisabled,
                  child: Text('Save Income Projection'),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}