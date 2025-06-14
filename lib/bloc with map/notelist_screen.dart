import 'package:counter_app/bloc%20with%20map/database/addNote_screen.dart';
import 'package:counter_app/bloc%20with%20map/database/note_bloc/note_bloc.dart';
import 'package:counter_app/bloc%20with%20map/database/note_bloc/note_event.dart';
import 'package:counter_app/bloc%20with%20map/database/note_bloc/note_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotelistScreen extends StatefulWidget {
  const NotelistScreen({super.key});

  @override
  State<NotelistScreen> createState() => _NotelistScreenState();
}

class _NotelistScreenState extends State<NotelistScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOTE APP"),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(builder: (context, state) {
        var note = state.noteList;
        return Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: note.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          note[index]['title'],
                        ),
                        subtitle: Text(
                          note[index]["description"],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AddnoteScreen(
                                        existingTitle: note[index]['title'],
                                        existingDescription: note[index]
                                            ["description"],
                                        titleController: titleController,
                                        descriptionController:
                                            descriptionController,
                                        onTap: () {
                                          context.read<NoteBloc>().add(
                                                  UpdateNoteEvent(noteData: {
                                                "title": titleController.text,
                                                "description":
                                                    descriptionController.text
                                              }, index: index));
                                        },
                                        title: "update note ",
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  context
                                      .read<NoteBloc>()
                                      .add(DeleteNoteEvent(index: index));
                                },
                                icon: Icon(Icons.delete))
                          ],
                        ),
                      );
                    }))
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddnoteScreen(
                    titleController: titleController,
                    descriptionController: descriptionController,
                    onTap: () {
                      context.read<NoteBloc>().add(AddNoteEvent(noteData: {
                            "title": titleController.text,
                            "description": descriptionController.text
                          }));
                    },
                    title: 'Add NOte',
                  )));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
