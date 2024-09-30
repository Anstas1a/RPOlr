part of 'notes_bloc.dart';

class NotesState extends Equatable {
  final List<Note>? notes;
  final String? title;
  final String content;
  final bool isLoading;
  final String onError;

  const NotesState({
    this.notes,
    this.title = '',
    this.content = '',
    this.isLoading = true,
    this.onError = '',
  });

  NotesState copyWith({
    List<Note>? notes,
    String? title,
    String? content,
    bool? isLoading,
    String? onError,
  }) {
    return NotesState(
      notes: notes ?? this.notes,
      title: title ?? this.title,
      content: content ?? this.content,
      isLoading: isLoading ?? this.isLoading,
      onError: onError ?? this.onError,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        notes,
        title,
        content,
        isLoading,
        onError,
      ];
}
