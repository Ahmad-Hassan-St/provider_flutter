
import 'package:flutter/foundation.dart';

class HeightProvider extends ChangeNotifier{

  double _height =180;
  get height=>_height;
  void setHeight( height){
    _height = height;
    notifyListeners();
  }
}