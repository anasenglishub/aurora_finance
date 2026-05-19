import 'package:aurora_finance/app/model_view/settings/fixed_bills_model_view.dart';
import 'package:flutter/material.dart';
import 'package:aurora_finance/app/entities/fixed_bill.dart';
import 'package:aurora_finance/app/shared/enums/fixed_bill_status.dart';

class FixedBillItem extends StatefulWidget {
  const FixedBillItem({super.key, required this.bill, required this.fixedBillsModelView});

  final FixedBill bill;
  final FixedBillsModelView fixedBillsModelView;

  @override
  State<FixedBillItem> createState() => _FixedBillItemState();
}

class _FixedBillItemState extends State<FixedBillItem> {
  @override
  void initState() {
    super.initState();
    if (widget.bill.dueDate.isBefore(DateTime.now())) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.fixedBillsModelView.changeBillStatus(widget.bill, FixedBillStatus.overdue);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isPayed = widget.bill.status == FixedBillStatus.paid;

    void setIsPayed(bool value) {
      setState(() {
        isPayed = value;
      });
      FixedBillStatus newStatus = value ? FixedBillStatus.paid : FixedBillStatus.pending;
      widget.fixedBillsModelView.changeBillStatus(widget.bill, newStatus);
    }

    Color? statusColor(FixedBill bill) {
      switch(bill.status.name) {
        case 'Atrasado':
          return Colors.red[100];
        case 'Pago':
          return Colors.lightGreen[100];
        default:
          return Colors.amber[100];
      }
    }

    Color? statusTextColor(FixedBill bill) {
      switch(bill.status.name) {
        case 'Atrasado':
          return Colors.red[600];
        case 'Pago':
          return Colors.lightGreen[600];
        default:
          return Colors.amber[800];
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            horizontalTitleGap: 0,
            checkboxShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            title: Text(
              widget.bill.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            value: isPayed, 
            onChanged: (value) => setIsPayed(value ?? false),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor(widget.bill),
                borderRadius: BorderRadius.circular(16),
              ), 
              child: Text(
                widget.bill.status.name.toString(),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: statusTextColor(widget.bill),
                  fontWeight: FontWeight(600)
                )
              ),
            ),
            SizedBox(width: 8,),
            Text(
              'R\$${widget.bill.amount.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}