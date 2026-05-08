import 'package:flutter/material.dart';
import 'package:aurora_finance/app/entities/IncomeTransaction.dart';
import 'package:aurora_finance/app/model_view/settings/available_fund_model_view.dart';
import 'package:aurora_finance/app/shared/enums/allocation_types.dart';

class TransactionsModelView extends ChangeNotifier {
  static final TransactionsModelView _instance = TransactionsModelView._internal();
  factory TransactionsModelView() => _instance;
  TransactionsModelView._internal();
  
  // Add your transaction-related state and methods here
  double _variableIncome = 0.0;
  double _ccReserve = 0.0;

  List<IncomeTransaction> _incomeTransactions = [];

  List<IncomeTransaction> get incomeTransactions => _incomeTransactions;
  double get unallocatedIncome => _incomeTransactions
      .where((transaction) => !transaction.allocatedToBudget)
      .fold(0.0, (sum, transaction) => sum + transaction.amount);

  double get variableIncome => _variableIncome;
  double get ccReserve => _ccReserve;

  void addIncomeTransaction(IncomeTransaction transaction) {
    _incomeTransactions.add(
      IncomeTransaction(
        amount: transaction.amount,
        description: transaction.description,
        date: DateTime.now(),
        category: transaction.category,
      ),
    );
    _variableIncome += transaction.amount;
    notifyListeners();
  }

  void allocateTransaction(IncomeTransaction transaction, AllocationType type) {
    final index = _incomeTransactions.indexOf(transaction);
    if (index == -1 || transaction.allocatedToBudget) return;

    // Mark allocated
    _incomeTransactions[index] = IncomeTransaction(
      amount: transaction.amount,
      description: transaction.description,
      date: transaction.date,
      allocatedToBudget: true,
      category: transaction.category,
    );

    // Move from variable to destination
    _variableIncome -= transaction.amount;
    
    if (type == AllocationType.budget) {
      AvailableFundModelView().addToExpectedIncome(transaction.amount);
    } else if (type == AllocationType.ccReserve) {
      _ccReserve += transaction.amount;
    }

    notifyListeners();
  }
}
