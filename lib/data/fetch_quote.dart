import 'dart:convert';
import 'dart:developer';
import 'package:helloworld/models/quote.dart';
import 'package:http/http.dart';

Future<Quote?> fetchQuote() async {
  const String url = 'https://api.quotable.io/random';

  try {
    final Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Quote.fromJson(data); // Преобразуем JSON в объект Quote
    } else {
      log('Ошибка при запросе данных: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    log('Произошла ошибка: $e');
    return null;
  }
}
