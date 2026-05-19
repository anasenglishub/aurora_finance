import 'package:flutter/material.dart';
import 'package:aurora_finance/app/entities/fixed_bill.dart';
import 'package:aurora_finance/app/shared/enums/fixed_bill_status.dart';

class FixedBillsModelView extends ChangeNotifier {
  static final FixedBillsModelView _instance = FixedBillsModelView._internal();
  factory FixedBillsModelView() => _instance;
  FixedBillsModelView._internal();
  
  final List<FixedBill> _fixedBills = [];
  
  List<FixedBill> get fixedBills => _fixedBills;
  
  void addFixedBill(FixedBill bill) {
    _fixedBills.add(bill);
    notifyListeners();
  }
  
  void removeFixedBill(FixedBill bill) {
    _fixedBills.remove(bill);
    notifyListeners();
  }

  void changeBillStatus(FixedBill bill, FixedBillStatus newStatus) {
    final index = _fixedBills.indexOf(bill);
    if (index == -1) return;

    _fixedBills[index] = FixedBill(name: bill.name, amount: bill.amount, status: newStatus, dueDate: bill.dueDate);
    notifyListeners();
  }
}