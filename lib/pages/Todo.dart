class ToDo{
  String? id;
  String? text;
  bool done;

  ToDo({
    required this.id,
    required this.text,
    this.done = false,
});
  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', text: 'ทำการบ้านครั้งที่ 4 วิชา Mobile App Dev', done: true),
      ToDo(id: '02', text: 'ทำการบ้านครั้งที่ 5 วิชา Mobile App Dev'),
      ToDo(id: '03', text: 'ทำโปรเจ็ควิชา Mobile App Dev'),
    ];
  }
}