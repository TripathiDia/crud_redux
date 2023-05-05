import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rdxprj/redux/reducers.dart';

import '../model/cart_item.dart';
import '../redux/action/add_item_action.dart';

class AddItemDialog extends StatefulWidget {
  const AddItemDialog({super.key});

  @override
  AddItemDialogState createState() {
    return AddItemDialogState();
  }
}

class AddItemDialogState extends State<AddItemDialog> {
  late String itemName;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, OnItemAddedCallback>(
      converter: (store) => (itemName) => store
          .dispatch(AddItemAction(CartItem(name: itemName, checked: false))),
      builder: (context, callback) => AlertDialog(
        title: const Text('Add Item'),
        contentPadding: const EdgeInsets.all(16.0),
        content: Row(
          children: <Widget>[
            Expanded(
                child: TextField(
              autofocus: true,
              decoration:
                  const InputDecoration(labelText: "Item Name", hintText: ""),
              onChanged: (text) {
                setState(() {
                  itemName = text;
                });
              },
            ))
          ],
        ),
        actions: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel")),
          ElevatedButton(
              onPressed: () {
                callback(itemName);
                Navigator.pop(context);
              },
              child: const Text("Add"))
        ],
      ),
    );
  }
}

typedef OnItemAddedCallback = Function(String itemName);

