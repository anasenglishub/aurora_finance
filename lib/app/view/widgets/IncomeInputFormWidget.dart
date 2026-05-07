import 'package:aurora_finance/app/view/widgets/UI/CustomButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:aurora_finance/app/view/widgets/UI/MonthPicker.dart';
import 'package:intl/intl.dart';
import 'package:aurora_finance/app/view/widgets/UI/CustomInputWidget.dart';
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

  @override
  void dispose() {
    _monthController.dispose();
    _incomeController.dispose();
    _billsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projection Month'.toUpperCase(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
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
          CustomButtonWidget(
            onPressed: () {              
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('You are saving your income'),
                  content: Text('You have set your income to R\$${_incomeController.text}  and your fixed bills to R\$${_billsController.text}. Is that correct?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        _availableFundModelView.setExpectedIncome(double.parse(_incomeController.text));
                        _availableFundModelView.setTotalFixedBills(double.parse(_billsController.text));
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('No'),
                    ),
                  ],
                ),
              );
            },
            child: Text('Save Income Projection'),
          ),
        ],
      ),
    );
  }
}