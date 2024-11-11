import 'package:flutter/material.dart';

class ToDoItem extends StatefulWidget {
  final String title;
  final VoidCallback onDelete;
  final bool isClicked;
  final ValueChanged<bool> onToggleHeart;

  const ToDoItem({
    Key? key,
    required this.title,
    required this.onDelete,
    required this.isClicked,
    required this.onToggleHeart,
  }) : super(key: key);

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(
          widget.isClicked
              ? Icons.favorite_rounded
              : Icons.favorite_outline_rounded,
          color: widget.isClicked ? Colors.red : Colors.grey,
        ),
        onPressed: () {
          widget.onToggleHeart(!widget.isClicked);
        },
      ),
      title: Text(widget.title),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.grey,
        ),
        onPressed: widget.onDelete,
      ),
    );
  }
}
