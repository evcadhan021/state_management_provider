// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges; // Import package badges

import '../screens/cart_screen.dart';
import '../widgets/product_grid.dart';
import '../providers/cart.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          Consumer<Cart>(
            builder: (context, value, ch) {
              return badges.Badge(
                badgeContent: Text(
                  value.jumlah.toString(), // Menampilkan jumlah di badge
                  style: const TextStyle(color: Colors.white),
                ),
                child: ch, // Menampilkan IconButton di dalam badge
              );
            },
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routeName,
                );
              },
            ),
          ),
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
