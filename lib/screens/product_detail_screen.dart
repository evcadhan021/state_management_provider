import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../providers/all_products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeNameDetailScreen = '/product-detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments as String?; // is the id!
    final product = Provider.of<Products>(context).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Center(
        child: Column(
          children: [
            // hapus komen ini jika sudah tau alasan kenapa Dart menyarankan untuk mengganti Container menjadi SizedBox
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
          ],
        ),
      ),
    );
  }
}
