import 'package:flutter/material.dart';

import '../pages/Todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onTodo;
  final onDelete;

  const ToDoItem({Key? key, required  this.todo, required this.onTodo, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: (){
            onTodo(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      tileColor: Colors.grey.shade300,
      leading: Icon(
          todo.done? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.black),
      title: Text(
        todo.text!,
        style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo.done? TextDecoration.lineThrough : null),
      ),
      trailing: Container(
        height: 35,
        width: 35,
        child: IconButton(
          color: Colors.black,
          iconSize: 20,
          icon: Icon(Icons.delete),
          onPressed: () {
            onDelete(todo.id);
          },
        ),
      ),
    ));
  }
}
