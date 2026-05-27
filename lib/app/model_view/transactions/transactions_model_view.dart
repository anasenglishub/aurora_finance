import 'package:aurora_finance/app/shared/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:aurora_finance/app/entities/transaction.dart';
import 'package:aurora_finance/app/model_view/settings/available_fund_model_view.dart';

class TransactionsModelView extends ChangeNotifier {
  static final TransactionsModelView _instance =
      TransactionsModelView._internal();
  factory TransactionsModelView() => _instance;
  TransactionsModelView._internal();

  // Add your transaction-related state and methods here
  double _variableIncome = 0.0;
  double _ccReserve = 0.0;

  final List<Transaction> _incomeTransactions = [];
  final List<Transaction> _expenseTransactions = [];
  final List<Transaction> _ccReserveTransactions = [];

  List<Transaction> get incomeTransactions => _incomeTransactions;
  double get unallocatedIncome => _incomeTransactions
      .where((transaction) => !transaction.allocatedToBudget)
      .fold(0.0, (sum, transaction) => sum + transaction.amount);

  double get variableIncome => _variableIncome;
  double get ccReserve => _ccReserve;
  List<Transaction> get expenseTransactions => _expenseTransactions;

  void addIncomeTransaction(Transaction transaction) {
    _incomeTransactions.add(
      Transaction(
        amount: transaction.amount,
        description: transaction.description,
        date: transaction.date ?? DateTime.now(),
        category: transaction.category,
        movementType: transaction.movementType,
      ),
    );
    _variableIncome += transaction.amount;
    AvailableFundModelView().addToAvailableFund(transaction.amount);
    notifyListeners();
  }

  void addToCcReserve(Transaction transaction, BuildContext context) {
    final index = _incomeTransactions.indexOf(transaction);
    if (index == -1 || transaction.allocatedToBudget) return;
    if (_ccReserveTransactions.any((t) => t == transaction)) {
      DialogUtils.showError(
        context: context,
        message: 'This transaction is already in the CC Reserve',
      );
      return;
    }

    // Mark allocated
    _incomeTransactions[index] = Transaction(
      amount: transaction.amount,
      description: transaction.description,
      date: transaction.date ?? DateTime.now(),
      allocatedToBudget: true,
      category: transaction.category,
      movementType: transaction.movementType,
    );

    _ccReserveTransactions.add(transaction);

    _ccReserve += transaction.amount;
    _variableIncome -= transaction.amount;

    notifyListeners();
  }

  void addExpenseTransaction(Transaction transaction) {
    _expenseTransactions.add(
      Transaction(
        amount: transaction.amount,
        description: transaction.description,
        date: transaction.date ?? DateTime.now(),
        category: transaction.category,
        movementType: transaction.movementType,
      ),
    );
    AvailableFundModelView().subtractFromAvailableFund(transaction.amount);
    notifyListeners();
  }
}
