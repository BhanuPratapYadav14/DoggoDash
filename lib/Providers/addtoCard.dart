import 'package:flutter/material.dart';

class addtoCart with ChangeNotifier {
  List<Map<String, String>> CartItems = [];

  void cartItem(Map<String, String> item) {
    CartItems.add(item);
    print("Cart Item : ${CartItems}");
    notifyListeners();
  }

  List<Map<String, String>> get getcartItem => CartItems;
}
