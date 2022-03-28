import 'dart:math';

class CalculateBrain {
  final int? weight, height;
  CalculateBrain({this.weight, this.height});
  double _bmi = 0;

  String bmiCalculate() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMIResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Lower';
    }
  }

  String getBMIMassage() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job';
    } else {
      return 'You have a lower than normal body weight. You have eat a bir more';
    }
  }
}
