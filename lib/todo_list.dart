import 'package:flutter/material.dart';
import 'package:todo_app/todo.dart';

class TodoList extends StatelessWidget {
  TodoList({@required this.todos, @required this.onTodoToggle});
  List<Todo> todos;
  final Function onTodoToggle;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: todos.length,
    );
  }

  Widget _buildItem(BuildContext buildContext, int index) {
    final todo = todos[index];

    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
      onChanged: (bool isChecked) {
        onTodoToggle(todo, isChecked);
      },
    );
  }
}
