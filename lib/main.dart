import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rdxprj/model/cart_item.dart';
import 'package:rdxprj/redux/reducers.dart';
import 'views/shopping_cart.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<List<CartItem>>(cartItemsReducer, initialState: []);

  runApp(ShoppingApp(store: store));
}

class ShoppingApp extends StatelessWidget {
  final Store<List<CartItem>> store;

  const ShoppingApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: ShoppingCart(store: store),
      ),
    );
  }
}
