import 'package:flutter/material.dart';

class SkippingDistanceProvider with ChangeNotifier {
  String _distance = '';

  String get distance => _distance;

  void setDistance(String value) {
    _distance = value;
    notifyListeners();
  }

  void clearDistance() {
    _distance = '';
    notifyListeners();
  }
}
