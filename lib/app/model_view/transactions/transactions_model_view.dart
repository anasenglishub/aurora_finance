import 'package:flutter/material.dart';

class TransactionsModelView extends ChangeNotifier {
  static final TransactionsModelView _instance = TransactionsModelView._internal();
  factory TransactionsModelView() => _instance;
  TransactionsModelView._internal();
  
  // Add your transaction-related state and methods here
  // List<IncomeTransaction>
}
