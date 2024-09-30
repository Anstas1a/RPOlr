import 'dart:convert';
import 'package:helloworld/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesStorage {
  static const String _key = 'notes';

  Future<List<Note>> loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? notesJson = prefs.getString(_key);
    if (notesJson != null) {
      List<dynamic> jsonList = jsonDecode(notesJson);
      return jsonList.map((json) => Note.fromMap(json)).toList();
    }
    return [];
  }

  Future<void> saveNotes(List<Note> notes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> jsonList =
        notes.map((note) => note.toMap()).toList();
    prefs.setString(_key, jsonEncode(jsonList));
  }
}
