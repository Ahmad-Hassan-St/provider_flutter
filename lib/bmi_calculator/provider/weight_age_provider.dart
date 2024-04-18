

import 'package:flutter/foundation.dart';

class WeightAgeProvider with ChangeNotifier{
  int _weight = 60;
  int _age=20;
  int get weight => _weight;
  int get age => _age;

  void setWeight(int value){
    _weight = value;
    notifyListeners();
  }
  void setAge(int value){
    _age = value;
    notifyListeners();
  }

}