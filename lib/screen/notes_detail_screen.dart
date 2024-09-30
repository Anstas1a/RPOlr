import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:helloworld/bloc/notes_bloc.dart';
import 'package:helloworld/models/note_model.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note note;

  const NoteDetailScreen({
    required this.note,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String title = note.title;
    String content = note.content;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              context.read<NotesBloc>().add(
                    UpdateNoteEvent(
                      note: note,
                      title: title,
                      content: content,
                    ),
                  );
              Navigator.pop(context); // Возврат к списку после сохранения
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: title,
              onChanged: (String value) {
                title = value;
              },
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            Expanded(
              child: TextFormField(
                initialValue: content,
                onChanged: (String value) {
                  content = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Content',
                ),
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
