import 'package:flutter/material.dart';
import 'package:provider_app/model/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void addToCart(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  double getCartTotal() {
    return _items.fold(
        0, (previousValue, product) => (previousValue + product.price));
  }

  int getTotalItems() {
    return _items.length;
  }
}
