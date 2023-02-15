import 'package:healthiq/const.dart';

class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Alzhemorozon ~ 2mg Daily'),
      ToDo(id: '02', todoText: 'Tylon ~5mg Daily'),
      ToDo(
        id: '03',
        todoText: '1 hour daily yoga',
      ),
      ToDo(
        id: '04',
        todoText: '5 km daily walk',
      ),
      ToDo(
        id: '05',
        todoText: '5L water drink daily',
      ),
      ToDo(
        id: '06',
        todoText: '8 hours daily sleep',
      ),
    ];
  }
}
