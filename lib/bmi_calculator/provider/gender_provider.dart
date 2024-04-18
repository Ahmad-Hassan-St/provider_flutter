
import 'package:flutter/foundation.dart';
enum Gender {
  male,
  female,
}
class GenderProvider with ChangeNotifier{
  Gender _selectedGender = Gender.male;
  get selectedGender=>_selectedGender;

  void changeGender(Gender gender){
    _selectedGender = gender;
    notifyListeners();
  }

}