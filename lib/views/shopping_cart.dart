import 'package:flutter/material.dart';

import '../model/cart_item.dart';
import 'add_item_dialog.dart';
import 'shopping_list.dart';
import 'package:redux/redux.dart';

class ShoppingCart extends StatelessWidget {


  final Store<List<CartItem>> store;

  const ShoppingCart({super.key, required this.store});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
      ),
      body: const ShoppingList(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            _openAddItemDialog(context);
          }),
    );
  }
}

_openAddItemDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => AddItemDialog());
}

