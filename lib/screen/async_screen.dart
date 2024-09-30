import 'package:flutter/material.dart';
import 'package:helloworld/data/fetch_quote.dart';
import 'package:helloworld/models/quote.dart';

class AsyncNsLab extends StatefulWidget {
  const AsyncNsLab({super.key});

  @override
  State<AsyncNsLab> createState() => _AsyncNsLabState();
}

class _AsyncNsLabState extends State<AsyncNsLab> {
  // Список для хранения выводимых данных
  final List<String> outputLogs = <String>[];
  bool isLoading = false; // Переменная для состояния загрузки

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setState(() {
      outputLogs.clear();
      isLoading = true; // Включаем лоудер при начале загрузки
    });

    Quote? quote = await fetchQuote();

    if (quote != null) {
      _addToLog('Цитата: ${quote.content}');
      _addToLog('Автор: ${quote.author}');
    } else {
      _addToLog('Не удалось получить цитату.');
    }

    setState(() {
      isLoading = false; // Выключаем лоудер после завершения загрузки
    });
  }

  // Функция для добавления строки в лог и обновления UI
  void _addToLog(String message) {
    setState(() {
      outputLogs.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Lab'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    ) // Лоудер
                  : ListView.builder(
                      itemCount: outputLogs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(outputLogs[index]),
                        );
                      },
                    ),
            ),
            ElevatedButton(
              onPressed: () => isLoading ? null : init(),
              child: const Text('Обновить данные'),
            ),
          ],
        ),
      ),
    );
  }
}
