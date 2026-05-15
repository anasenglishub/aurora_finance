import 'package:aurora_finance/app/shared/enums/transaction_categories.dart';

class Transaction {
  final double amount;
  final String description;  // e.g., "New student - Maria"
  final DateTime? date;
  final bool allocatedToBudget;  // true if added to available fund
  final TransactionCategory category;
  final String movementType;  

  Transaction({
    required this.amount,
    required this.description,
    this.date,
    this.allocatedToBudget = false,
    required this.category,
    required this.movementType,
  });
}