// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:state_management_provider/models/cart_item.dart';

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get jumlah {
    return _items.length;
  }

  double get totalHarga {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.qty * cartItem.price;
    });
    return total;
  }

  void addCart(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      // ketika sudah tersedia key product id
      items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          price: value.price,
          qty: value.qty + 1,
          title: value.title,
        ),
      );
    } else {
      // nambah product id baru
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          price: price,
          qty: 1,
          title: title,
        ),
      );
    }
    notifyListeners();
  }

  findById(String? productId) {}
}
