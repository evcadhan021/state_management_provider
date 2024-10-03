import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil data Provider menggunakan Provider.of
    final productData = Provider.of<Product>(context, listen: false);
    print("Widget Rebuild");
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        // Ini bagian Child
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              // saat ini diKlik maka akan di arahkan ke halaman yang kita klik sesuai dengan id
              ProductDetailScreen.routeNameDetailScreen,
              arguments: productData.id,
            );
          },
          child: Image.network(
            productData.imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
        // Ini bagian Footer
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          // sedangkan ini mengambil data Provider menggunakan Consumer
          leading: Consumer<Product>(
            builder: (context, productData, child) => IconButton(
              icon: (productData.isFavorite)
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border_outlined),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                productData.statusFav();
              },
            ),
          ),
          title: Text(
            productData.title!,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              productData.statusFav2();
            },
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
