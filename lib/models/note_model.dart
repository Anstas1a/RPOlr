import 'package:uuid/uuid.dart';

class Note {
  String id;
  String title;
  String content;
  DateTime dateEdited;

  Note({
    required this.title,
    required this.content,
    required this.dateEdited,
    String? id,
  }) : id = id ?? const Uuid().v4();

  Note copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? dateEdited,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      dateEdited: dateEdited ?? this.dateEdited,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'dateEdited': dateEdited.toIso8601String(),
    };
  }

  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      dateEdited: DateTime.parse(map['dateEdited']),
    );
  }
}
