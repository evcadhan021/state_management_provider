import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/all_products.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          ProductDetailScreen.routeNameDetailScreen: (ctx) =>
              const ProductDetailScreen(),
        },
      ),
    );
  }
}

// class ScreenSementara extends StatelessWidget {
//   ScreenSementara({super.key});
//   List<Text> myList = List.generate(
//       25,
//       (index) => Text(
//             "${index + 1}",
//             style: const TextStyle(fontSize: 35),
//           ));
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             color: Colors.purple,
//           ),
//           ...myList,
//           Container(
//             width: 100,
//             height: 100,
//             color: Colors.green,
//           )
//         ],
//       ),
//     );
//   }
// }
