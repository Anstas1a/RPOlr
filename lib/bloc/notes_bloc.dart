import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:helloworld/models/note_model.dart';
import 'package:helloworld/services/firebase_manager.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc(this.firebaseManager) : super(const NotesState()) {
    on<LoadNotesEvent>(_onLoadNotes);
    on<AddNoteEvent>(_onAddNote);
    on<UpdateNoteEvent>(_onUpdateNote);
    on<DeleteNoteEvent>(_onDeleteNote);
  }
  final FirebaseManager firebaseManager;

  Future<void> _onLoadNotes(
      LoadNotesEvent event, Emitter<NotesState> emit) async {
    try {
      // Загрузка заметок из Firebase
      final notes = await firebaseManager.getNotes();
      emit(NotesState(notes: notes, isLoading: false));
    } catch (e) {
      emit(const NotesState(onError: 'Failed to load notes from Firebase'));
    }
  }

  Future<void> _onAddNote(AddNoteEvent event, Emitter<NotesState> emit) async {
    try {
      final newNote = Note(
        title: event.title ?? '',
        content: event.content ?? '',
        dateEdited: DateTime.now(),
      );

      // Добавление заметки в Firebase
      await firebaseManager.addNote(newNote);

      // Обновление состояния с новой заметкой
      final updatedNotes = List<Note>.from(state.notes ?? [])..add(newNote);
      emit(NotesState(notes: updatedNotes, isLoading: false));
    } catch (e) {
      emit(NotesState(
          notes: state.notes, isLoading: false, onError: 'Failed to add note'));
    }
  }

  Future<void> _onUpdateNote(
      UpdateNoteEvent event, Emitter<NotesState> emit) async {
    try {
      final updatedNote = event.note!.copyWith(
        title: event.title ?? event.note!.title,
        content: event.content ?? event.note!.content,
        dateEdited: DateTime.now(),
      );

      // Обновление заметки в Firebase
      await firebaseManager.updateNote(updatedNote);

      // Обновление списка заметок
      final updatedNotes = state.notes!
          .map((note) => note.id == updatedNote.id ? updatedNote : note)
          .toList();

      emit(NotesState(notes: updatedNotes, isLoading: false));
    } catch (e) {
      emit(NotesState(
          notes: state.notes,
          isLoading: false,
          onError: 'Failed to update note'));
    }
  }

  Future<void> _onDeleteNote(
      DeleteNoteEvent event, Emitter<NotesState> emit) async {
    try {
      await firebaseManager.deleteNote(event.note.id);

      final updatedNotes =
          state.notes!.where((note) => note.id != event.note.id).toList();
      emit(NotesState(notes: updatedNotes, isLoading: false));
    } catch (e) {
      emit(NotesState(
          notes: state.notes,
          isLoading: false,
          onError: 'Failed to delete note'));
    }
  }
}
