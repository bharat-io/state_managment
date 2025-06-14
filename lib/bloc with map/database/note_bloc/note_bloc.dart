import 'package:counter_app/bloc%20with%20map/database/note_bloc/note_event.dart';
import 'package:counter_app/bloc%20with%20map/database/note_bloc/note_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteState(noteList: [])) {
    on<AddNoteEvent>(
      (event, emit) {
        List<Map<String, dynamic>> initialData = state.noteList;
        initialData.add(event.noteData);
        emit(NoteState(noteList: initialData));
      },
    );

    on<UpdateNoteEvent>((event, emit) {
      List<Map<String, dynamic>> updatedNotes = state.noteList;
      updatedNotes[event.index] = event.noteData;
      emit(NoteState(noteList: updatedNotes));
    });

    on<DeleteNoteEvent>((event, emit) {
      List<Map<String, dynamic>> initialData = state.noteList;
      initialData.removeAt(event.index);
      emit(NoteState(noteList: initialData));
    });
  }
}
