import 'package:counter_app/bloc%20with%20Db/bloc/todo_bloc.dart';
import 'package:counter_app/bloc%20with%20Db/bloc/todo_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateTodoScreen extends StatefulWidget {
  const UpdateTodoScreen(
      {super.key,
      required this.id,
      this.existingTitle,
      this.existingDescription});
  final int id;
  final String? existingTitle;
  final String? existingDescription;

  @override
  State<UpdateTodoScreen> createState() => _UpdateTodoScreenState();
}

class _UpdateTodoScreenState extends State<UpdateTodoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.existingTitle ?? "");
    descriptionController =
        TextEditingController(text: widget.existingDescription ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(
              height: 14,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    context.read<TodoBloc>().add(UpdateTodo(
                        id: widget.id,
                        title: titleController.text,
                        description: descriptionController.text));

                    Navigator.pop(context);
                    titleController.clear();
                    descriptionController.clear();
                  },
                  child: Text("Save")),
            )
          ],
        ),
      ),
    );
  }
}
