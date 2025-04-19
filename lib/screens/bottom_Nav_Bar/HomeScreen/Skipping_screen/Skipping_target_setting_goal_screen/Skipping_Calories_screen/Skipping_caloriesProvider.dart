import 'package:flutter/material.dart';

class SkippingCaloriesProvider with ChangeNotifier {
  String _calories = '';

  String get calories => _calories;

  void setCalories(String value) {
    _calories = value;
    notifyListeners();
  }

  void clearDistance() {
    _calories = '';
    notifyListeners();
  }
}
