import 'package:flutter/material.dart';

class ShoppingItem extends StatefulWidget {
  const ShoppingItem({super.key});

  @override
  ShoppingItemState createState() {
    return ShoppingItemState();
  }
}

class ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {},
      child: ListTile(
        title: const Text("List"),
        leading: Checkbox(
          value: false,
          onChanged: (newValue) {
            setState(() {
            });
          },
        ),
        trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
      ),
    );
  }
}

