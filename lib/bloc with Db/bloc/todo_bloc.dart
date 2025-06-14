import 'package:counter_app/bloc%20with%20Db/bloc/todo_event.dart';
import 'package:counter_app/bloc%20with%20Db/bloc/todo_state.dart';
import 'package:counter_app/bloc%20with%20Db/database/db_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(todoData: [])) {
    DbService dbService = DbService.getInstance();

    on<FetchTodo>(
      (event, emit) async {
        List<Map<String, dynamic>> allTodos = await dbService.fetchData();
        emit(TodoState(todoData: allTodos));
      },
    );

    on<AddTodo>(
      (event, emit) async {
        bool success = await dbService.addData(
            title: event.title, description: event.description);
        if (success) {
          List<Map<String, dynamic>> allTodos = await dbService.fetchData();
          emit(TodoState(todoData: allTodos));
        }
      },
    );
    on<UpdateTodo>(
      (event, emit) async {
        bool isSuccess = await dbService.updateData(
            title: event.title, description: event.description, id: event.id);

        if (isSuccess) {
          List<Map<String, dynamic>> updatedTodos = await dbService.fetchData();
          emit(TodoState(todoData: updatedTodos));
        }
      },
    );

    on<DeleteTodo>(
      (event, emit) async {
        bool isSuccess = await dbService.deleteData(id: event.id);

        if (isSuccess) {
          List<Map<String, dynamic>> updatedTodos = await dbService.fetchData();
          emit(TodoState(todoData: updatedTodos));
        }
      },
    );
  }
}
