import 'package:flutter/material.dart';
import 'package:todo_app/todo.dart';

class NewTodoDialog extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Todo'),
      content: TextField(
        autofocus: true,
        controller: textEditingController,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('Add'),
          onPressed: () {
            final todo = new Todo(title: textEditingController.value.text);
            textEditingController.clear();
            Navigator.of(context).pop(todo);
          },
        ),
      ],
    );
  }
}
