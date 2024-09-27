import 'package:flutter/material.dart';
import 'package:state_management_provider/providers/all_products.dart';
import 'package:state_management_provider/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});
  @override
  Widget build(BuildContext context) {
    // Data dari Provider
    final productData = Provider.of<Products>(context);
    final allproduct = productData.allproducts;

    // GridView.builder
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: allproduct.length,
      itemBuilder: (ctx, i) => ProductItem(
        allproduct[i].id!,
        allproduct[i].title!,
        allproduct[i].imageUrl!,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
