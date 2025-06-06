import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int getValue() => _counter;

  final List<Map<String, dynamic>> _employData = [];
  List<Map<String, dynamic>> getempData() => _employData;

  void addEmpData(String name, String emailID) {
    _employData.add({"name": name, "email": emailID});
  }

  //couter

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    if (_counter > 0) ;
    _counter--;
    notifyListeners();
  }
}
