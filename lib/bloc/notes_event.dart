part of 'notes_bloc.dart';

abstract class NotesEvent {}

class LoadNotesEvent extends NotesEvent {}

class AddNoteEvent extends NotesEvent {
  final String? title;
  final String? content;
  final Note? note;

  AddNoteEvent({
    this.note,
    this.title,
    this.content,
  });
}

class UpdateNoteEvent extends NotesEvent {
  final String? title;
  final String? content;
  final Note? note;

  UpdateNoteEvent({
    this.note,
    this.title,
    this.content,
  });
}

class DeleteNoteEvent extends NotesEvent {
  final Note note;

  DeleteNoteEvent(this.note);
}
