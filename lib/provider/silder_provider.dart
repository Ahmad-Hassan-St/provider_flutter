import 'package:flutter/foundation.dart';
class ColorProvider with ChangeNotifier{
  double _value=0.50;
  double get value => _value;
  set value(double value) {
    _value = value;
    notifyListeners();
  }
}