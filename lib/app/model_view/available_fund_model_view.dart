import 'package:flutter/material.dart';

class AvailableFundModelView extends ChangeNotifier {
  double _expectedIncome = 0.0;
  
  double get expectedIncome => _expectedIncome;
  
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
}
