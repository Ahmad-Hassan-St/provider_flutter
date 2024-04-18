import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _selectedIndex = [];

  List<int> get selectedIndex=>_selectedIndex;

  void favouriteItem(int index) {
    if(_selectedIndex.contains(index)){
      _selectedIndex.remove(index);
    }
    else{
      _selectedIndex.add(index);
    }
    notifyListeners();
  }
}
