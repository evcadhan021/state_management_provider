import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/all_products.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //*
    // ChangeNotifierProvider untuk memberikan akses masuk kepada Provider agar data nya bisa dipakai
    // apabila ChangeNotifierProvider tidak dipasang maka data dari Provider tidak bisa masuk dan dipakai
    // */
    return ChangeNotifierProvider(
      create: (context) {
        return Products();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: Colors.amber),
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
