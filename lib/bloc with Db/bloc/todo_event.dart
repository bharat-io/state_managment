class TodoEvent {}

class FetchTodo extends TodoEvent {
  // FetchTodo({required this.todoData});
  // List<Map<String, dynamic>> todoData;
}

class AddTodo extends TodoEvent {
  AddTodo({required this.title, required this.description});
  final String title;
  final String description;
}

class UpdateTodo extends TodoEvent {
  UpdateTodo(
      {required this.title, required this.description, required this.id});
  final String title;
  final String description;
  final int id;
}

class DeleteTodo extends TodoEvent {
  DeleteTodo({required this.id});

  final int id;
}
