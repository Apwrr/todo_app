
import 'package:flutter/material.dart';
import '../widgets/ToDo_item.dart';
import 'Todo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void _handleToDo(ToDo todo){
      setState(() {
        todo.done = !todo.done;
      });
    }
    void _deleteToDo(String id){
      setState(() {
        todosList.removeWhere((item) => item.id == id);
      });
    }
    void addToDo(String toDo){
      setState(() {
        todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(),
            text: toDo
        ),
        );
      });
      _todoController.clear();
    }

    return Scaffold(
      appBar: AppBar(title: Text('My ToDo')),
      body: Stack(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      for (ToDo todo in todosList) ToDoItem(
                          todo: todo,
                          onTodo: _handleToDo,
                        onDelete: _deleteToDo,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                  ),
                      decoration: BoxDecoration(color: Colors.white,
                          boxShadow: [BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0,0.0),
                          ),]
                      ) ,
                      child: TextField(
                        controller: _todoController,
                        decoration: InputDecoration(
                          hintText: 'Enter new ToDo',
                          border: InputBorder.none,
                        ),
                      ),
                ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20,right: 20,),
                  child: ElevatedButton(
                    child: Text('ADD', style: TextStyle(color: Colors.black)),
                    onPressed: (){
                      addToDo(_todoController.text);
                    } ,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
