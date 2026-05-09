import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/enums/transaction_categories.dart';
import 'package:aurora_finance/app/view/widgets/UI/custom_dropdown_widget.dart';
  
class NewTransactionFormWidget extends StatefulWidget {
  const NewTransactionFormWidget({super.key});

  @override
  State<NewTransactionFormWidget> createState() => _NewTransactionFormWidgetState();
}

class _NewTransactionFormWidgetState extends State<NewTransactionFormWidget> {
  final _transactionFormKey = GlobalKey<FormState>();
  final List<String> _categories = ['Select a category', ...TransactionCategory.values.map((category) => category.name)];
   
  // Controllers
  String? _movementType;
  String? _category;
  String? _paymentMethod;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Form(
        key: _transactionFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
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
                selected: {_movementType ?? 'expense'},
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
                  _category = value;
                });
              },
              initialValue: _category ?? 'Select a category',
              items: _categories,
              label: 'Category',
            ),

            CustomDropdownWidget(
              onChanged: (value) {
                setState(() {
                  _paymentMethod = value;
                });
              },
              initialValue: _paymentMethod ?? 'Select a payment method',
              items: ['Select a payment method', 'Credit Card', 'Debit Card', 'Pix'],
              label: 'Payment Method',
            ),

            Row(
              children: [
                
              ],
            )
          ],
        ),
      ),
    );
  }
}