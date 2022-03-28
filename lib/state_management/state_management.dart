import 'package:flutter/material.dart';

class StateManagement extends ChangeNotifier {
  bool _maleFemale = true;
  bool? get maleFemale => _maleFemale;

  void getMaleFemale(bool value) {
    _maleFemale = value;
    notifyListeners();
  }

  int _height = 130;
  int get height => _height;

  int _weight = 45;
  int get weight => _weight;

  int _age = 18;
  int get age => _age;

  void getIncreaseDecrease(String controller, int value) {
    controller == 'height'
        ? _height = value
        : controller == '+weight'
            ? _weight++
            : controller == '-weight'
                ? _weight--
                : controller == '+age'
                    ? _age++
                    : controller == '-age'
                        ? _age--
                        : null;
    notifyListeners();
  }
}
