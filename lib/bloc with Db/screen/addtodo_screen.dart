import 'package:counter_app/bloc%20with%20Db/bloc/todo_bloc.dart';
import 'package:counter_app/bloc%20with%20Db/bloc/todo_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddtodoScreen extends StatefulWidget {
  const AddtodoScreen({super.key});

  @override
  State<AddtodoScreen> createState() => _AddtodoScreenState();
}

class _AddtodoScreenState extends State<AddtodoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
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
                    context.read<TodoBloc>().add(AddTodo(
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
