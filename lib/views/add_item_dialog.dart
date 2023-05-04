import 'package:flutter/material.dart';

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
    return AlertDialog(
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
              Navigator.pop(context);
            },
            child: const Text("Add"))
      ],
    );
  }
}

typedef OnItemAddedCallback = Function(String itemName);
