import 'package:flutter/material.dart';

abstract class NoteEvent {}

class AddNoteEvent extends NoteEvent {
  AddNoteEvent({required this.noteData});
  Map<String, dynamic> noteData;
}

class UpdateNoteEvent extends NoteEvent {
  UpdateNoteEvent({required this.noteData, required this.index});
  Map<String, dynamic> noteData;
  int index;
}

class DeleteNoteEvent extends NoteEvent {
  DeleteNoteEvent({required this.index});
  int index;
}
