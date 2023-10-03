import 'package:flutter/material.dart';

class ExampleFirstProvider with ChangeNotifier {
  double _value = .5;
  double get value => _value;
  void setValue(double val) {
    _value = val;
    notifyListeners();
  }
}
