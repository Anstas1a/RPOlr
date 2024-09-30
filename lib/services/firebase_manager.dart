import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloworld/models/note_model.dart';

class FirebaseManager {
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');

  // Получение списка заметок
  Future<List<Note>> getNotes() async {
    QuerySnapshot snapshot = await notesCollection.get();
    return snapshot.docs
        .map((doc) => Note.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  // Добавление новой заметки
  Future<void> addNote(Note note) async {
    await notesCollection.doc(note.id).set(note.toMap());
  }

  // Обновление заметки
  Future<void> updateNote(Note note) async {
    await notesCollection.doc(note.id).update(note.toMap());
  }

  // Удаление заметки
  Future<void> deleteNote(String id) async {
    await notesCollection.doc(id).delete();
  }
}
