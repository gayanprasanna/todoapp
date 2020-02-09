import 'package:flutter/material.dart';
import 'package:todo_app/todo_list.dart';

import 'new_todo_dialog.dart';
import 'todo.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: TodoList(todos: todos, onTodoToggle: _toggleTodo),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }

  void _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  void _addTodo() async {
    final todo = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return NewTodoDialog();
        });

    setState(() {
      if (todo != null) {
        setState(() {
          todos.add(todo);
        });
      }
    });
  }
}
