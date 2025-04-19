import 'package:flutter/foundation.dart';

class RunningTimeProvider with ChangeNotifier {
  String _savedTime = "00:00:00";

  String get savedTime => _savedTime;

  void setTime(String newTime) {
    _savedTime = newTime;
    notifyListeners();
  }
}
