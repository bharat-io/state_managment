import 'package:counter_app/bloc%20with%20Db/bloc/todo_bloc.dart';
import 'package:counter_app/bloc%20with%20Db/bloc/todo_event.dart';
import 'package:counter_app/bloc%20with%20Db/bloc/todo_state.dart';
import 'package:counter_app/bloc%20with%20Db/database/db_service.dart';
import 'package:counter_app/bloc%20with%20Db/screen/addtodo_screen.dart';
import 'package:counter_app/bloc%20with%20Db/screen/updateTodo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(FetchTodo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo List",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (ctx, state) {
          if (state.todoData.isEmpty) {
            return const Center(
              child: Text(
                "No Todos Yet!",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: state.todoData.length,
            itemBuilder: (context, index) {
              var todo = state.todoData[index];

              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  title: Text(
                    todo[DbService.TODO_TITLE],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    todo[DbService.TODO_DESCRIPTION],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Edit Button
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UpdateTodoScreen(
                                existingTitle: todo[DbService.TODO_TITLE],
                                existingDescription:
                                    todo[DbService.TODO_DESCRIPTION],
                                id: todo[DbService.TODO_ID],
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                          onPressed: () {
                            context
                                .read<TodoBloc>()
                                .add(DeleteTodo(id: todo[DbService.TODO_ID]));
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddtodoScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
