import 'package:flutter/material.dart';

import 'shopping_item.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, i) => const ShoppingItem(),
    );
  }
}
