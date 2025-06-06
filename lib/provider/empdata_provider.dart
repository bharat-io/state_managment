import 'package:flutter/material.dart';

class EmpDataProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _empData = [];
  List<Map<String, dynamic>> getempData() => _empData;

  void addEmpData(String name, String emailId) {
    _empData.add({"name": name, "email": emailId});
    notifyListeners();
  }

  void updateEmpData(String name, String emailId, int id) {
    _empData[id] = {"name": name, "email": emailId};
    notifyListeners();
  }

  void deleteData(int index) {
    _empData.removeAt(index);
    notifyListeners();
  }
}
