import 'package:flutter/material.dart';
import 'package:helloworld/models/shape_model.dart';

class SecondLabScreen extends StatefulWidget {
  const SecondLabScreen({super.key});

  @override
  _SecondLabScreenState createState() => _SecondLabScreenState();
}

class _SecondLabScreenState extends State<SecondLabScreen> {
  List<String> logMessages = [];

  @override
  void initState() {
    super.initState();
    runProgram();
  }

  void runProgram() {
    var square = Square(4);
    square.printDetails(addLog);

    var rectangle = Rectangle(4, 5);
    addLog('Rectangle area: ${rectangle.calculateArea()}');

    var circle = Circle(3);
    addLog('Circle area: ${circle.calculateArea()}');

    var cube = Cube(3);
    cube.printDetails(addLog);

    var sphere = Sphere(3);
    sphere.printDetails(addLog);

    demoCollections();
    demoContinueAndBreak([1, 2, 3, 4, 5, 6, 7, 8]);
    demoExceptionHandling();
  }

  void addLog(String message) {
    setState(() {
      logMessages.add(message);
    });
  }

  /// 6. Continue and Break
  void demoContinueAndBreak(List<int> numbers) {
    for (var num in numbers) {
      if (num % 2 == 0) continue; // Пропустить четные числа
      addLog('Odd number: $num');
      if (num > 5) break; // Прерывание, если число больше 5
    }
  }

  /// 5. Collection Data
  void demoCollections() {
    List<Shape> shapes = [Square(4), Rectangle(5, 6), Circle(3)];
    for (var shape in shapes) {
      addLog('Area: ${shape.calculateArea()}');
    }

    Set<Square> squares = {Square(2), Square(3), Square(4)};
    for (var square in squares) {
      square.printDetails(addLog);
    }

    Set<int> uniqueNumbers = {1, 2, 3, 4, 1, 2};
    addLog('Unique numbers: $uniqueNumbers');
  }

  /// 7. Exception Handling
  void demoExceptionHandling() {
    try {
      var invalidCircle = Circle(0); // Исключение при радиусе 0
    } catch (e) {
      addLog('Caught an error: ${e.toString()}');
    }

    try {
      var invalidSquare = Square(-5); // Исключение при отрицательной стороне
    } catch (e) {
      addLog('Caught an error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Lab'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: logMessages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(logMessages[index]),
          );
        },
      ),
    );
  }
}
