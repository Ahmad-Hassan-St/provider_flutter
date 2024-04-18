
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
 var _themeProvider=ThemeMode.light;
 ThemeMode get themeMode=>_themeProvider;
 void setThemeMode(value){
   _themeProvider=value;
   notifyListeners();
 }

}