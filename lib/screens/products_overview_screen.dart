import 'package:flutter/material.dart';
import 'package:state_management_provider/widgets/product_grid.dart';

// import '../widgets/product_item.dart';
class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: ProductGrid(),
    );
  }
}
