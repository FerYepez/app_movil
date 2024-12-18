import 'package:flutter/material.dart';

class IMCModel extends ChangeNotifier {
  List<Map<String, dynamic>> _savedImcs = [];

  List<Map<String, dynamic>> get savedImcs => _savedImcs;

  void addIMC(double imc) {
    _savedImcs.add({
      'imc': imc,
      'date': DateTime.now(),
    });
    notifyListeners();
  }
}
