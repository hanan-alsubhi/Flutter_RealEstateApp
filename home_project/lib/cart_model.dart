import 'package:flutter/foundation.dart';

class CartItem {
  final String name;
  final String price;

  CartItem({required this.name, required this.price});
}

class Cart with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  int get itemCount => _items.length;
}