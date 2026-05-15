import 'package:flutter/material.dart';

class AvailableFundModelView extends ChangeNotifier {
  static final AvailableFundModelView _instance = AvailableFundModelView._internal();
  factory AvailableFundModelView() => _instance;
  AvailableFundModelView._internal();
  
  double _expectedIncome = 0.0;
  double _totalFixedBills = 0.0;
  double _availableFund = 0.0;
  
  double get expectedIncome => _expectedIncome;
  double get totalFixedBills => _totalFixedBills;
  double get availableFund => _availableFund;
  
  void setExpectedIncome(double value) {
    _expectedIncome = value;
    notifyListeners();
  }

  void addToExpectedIncome(double value) {
    _expectedIncome += value;
    notifyListeners();
  }
  
  void subtractFromExpectedIncome(double value) {
    _expectedIncome -= value;
    notifyListeners();
  }
  
  void setTotalFixedBills(double value) {
    _totalFixedBills = value;
    notifyListeners();
  }

  void addTotalFixedBills(double value) {
    _totalFixedBills += value;
    notifyListeners();
  }

  void addToAvailableFund(double value) {
    _availableFund += value;
    notifyListeners();
  }

  void subtractFromAvailableFund(double value) {
    _availableFund -= value;
    notifyListeners();
  }
}
