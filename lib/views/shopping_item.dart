import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../model/cart_item.dart';
import '../redux/action/add_item_action.dart';

class ShoppingItem extends StatefulWidget {
  final CartItem item;
  const ShoppingItem({super.key, required this.item});

  @override
  ShoppingItemState createState() {
    return ShoppingItemState();
  }
}

class ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, OnItemDeleted>(
      converter: (store) => (itemName) {
        store.dispatch(DeleteItemAction(widget.item));
      },
      builder: (context, callback) => Dismissible(
        onDismissed: (_) {
          setState(() {
            callback(widget.item.name);
          });
        },
        key: Key(widget.item.name),
        child: StoreConnector<List<CartItem>, OnToggleStateAction>(
          converter: (store) =>
              (item) => store.dispatch(ToggleStateItemAction(item)),
          builder: (context, callback) => ListTile(
            title: Text(widget.item.name),
            leading: Checkbox(
                value: widget.item.checked,
                onChanged: (newValue) {
                  setState(() {
                    callback(CartItem(
                        name: widget.item.name, checked: newValue ?? true));
                  });
                }),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    callback(CartItem(name: widget.item.name, checked: true));
                  });
                },
                icon: Icon(Icons.delete)),
          ),
        ),
      ),
    );
  }
}

typedef OnToggleStateAction = Function(CartItem item);
typedef OnItemDeleted = Function(String itemName);
