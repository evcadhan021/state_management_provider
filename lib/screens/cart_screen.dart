import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/providers/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Total : \$${cartData.totalHarga}",
                style: const TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: cartData.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${cartData.items.values.toList()[index].title}"),
                subtitle: Text(
                    "Quantity : ${cartData.items.values.toList()[index].qty} "),
                trailing: Container(
                  child: Text(
                      '\$${cartData.items.values.toList()[index].qty * cartData.items.values.toList()[index].price}'),
                ),
              );
            },
          )),
          Expanded(
              child: ListView.builder(
            itemCount: cartData.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${cartData.items.values.toList()[index].title}"),
                subtitle: Text(
                    "Quantity : ${cartData.items.values.toList()[index].qty} "),
                trailing: Container(
                  child: Text(
                      '\$${cartData.items.values.toList()[index].qty * cartData.items.values.toList()[index].price}'),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
