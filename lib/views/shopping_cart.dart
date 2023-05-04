import 'package:flutter/material.dart';

import 'add_item_dialog.dart';
import 'shopping_list.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

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

