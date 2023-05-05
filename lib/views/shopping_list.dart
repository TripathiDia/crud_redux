import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../model/cart_item.dart';
import 'shopping_item.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, List<CartItem>>(
      converter: (store) => store.state,
      builder: (context, list) => ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, i) => ShoppingItem(item: list[i]),
          ),
    );
  }
}
