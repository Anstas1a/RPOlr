import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:helloworld/bloc/notes_bloc.dart';

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String title = '';
    String content = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              context.read<NotesBloc>().add(
                    AddNoteEvent(title: title, content: content),
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
            TextField(
              onChanged: (String value) {
                title = value;
              },
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            Expanded(
              child: TextField(
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
