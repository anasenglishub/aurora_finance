import 'package:aurora_finance/app/shared/enums/fixed_bill_status.dart';

class FixedBill {
  final String name;
  final double amount;
  final FixedBillStatus status;
  final DateTime dueDate;
  
  FixedBill({
    required this.name,
    required this.amount,
    required this.status,
    required this.dueDate,
  });
}
