import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> selecctedItem = [];
  List <int> get list => selecctedItem;
  void addItem(int index) {
    selecctedItem.add(index);
    notifyListeners();
  }
  void removeItem(int index) {
    selecctedItem.remove(index);
    notifyListeners();
  }
}
