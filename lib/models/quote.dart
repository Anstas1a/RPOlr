class Quote {
  final String content;
  final String author;

  Quote({
    required this.content,
    required this.author,
  });

  // Фабричный метод для создания объекта Quote из JSON
  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      content: json['content'] as String,
      author: json['author'] as String,
    );
  }
}
