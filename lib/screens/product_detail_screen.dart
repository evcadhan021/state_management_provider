import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges; // Import package badges

import '../screens/cart_screen.dart';
import '../providers/cart.dart';
import '../providers/all_products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments as String?; // is the id!
    // Disini Letak mengambil data Provider menggunakan Provider.of
    final product = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                "${product.imageUrl}",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30.0),
            Text(
              "${product.title}",
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              "\$${product.price}",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              "${product.description}",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 15.0),
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Berhasil Ditambahkan"),
                    duration: Duration(
                      milliseconds: 500,
                    ),
                  ),
                );
                cart.addCart(
                  product.id!,
                  product.title!,
                  product.price!,
                );
              },
              child: const Text(
                "Add to cart",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
