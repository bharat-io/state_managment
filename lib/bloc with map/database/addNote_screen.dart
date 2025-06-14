import 'package:counter_app/bloc%20with%20map/database/note_bloc/note_bloc.dart';
import 'package:counter_app/bloc%20with%20map/database/note_bloc/note_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddnoteScreen extends StatefulWidget {
  AddnoteScreen(
      {super.key,
      required this.title,
      required this.onTap,
      this.existingDescription,
      this.existingTitle,
      required this.titleController,
      required this.descriptionController});
  final String title;
  final Function onTap;
  TextEditingController titleController;
  TextEditingController descriptionController;
  final String? existingTitle;
  final String? existingDescription;

  @override
  State<AddnoteScreen> createState() => _AddnoteScreenState();
}

class _AddnoteScreenState extends State<AddnoteScreen> {
  @override
  void initState() {
    super.initState();
    // widget.titleController =
    //     TextEditingController(text: widget.existingTitle ?? "");
    // widget.descriptionController =
    //     TextEditingController(text: widget.existingDescription ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: _buildTextField(),
      ),
    );
  }

  Widget _buildTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: widget.titleController,
          decoration: InputDecoration(
              hintText: "title",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
        ),
        SizedBox(
          height: 14,
        ),
        TextField(
          controller: widget.descriptionController,
          decoration: InputDecoration(
              hintText: "Description",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
        ),
        SizedBox(
          height: 14,
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                widget.onTap();
                Navigator.pop(context);
              },
              child: Text("Save")),
        )
      ],
    );
  }
}
