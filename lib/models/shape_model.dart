import 'dart:math';

abstract class Shape {
  double calculateArea();
}

class Square extends Shape implements PerimeterCalculation, PrintDetailsMixin {
  double width;

  Square(this.width) {
    if (width <= 0) {
      throw ArgumentError('Width cannot be negative or zero');
    }
  }

  @override
  double calculateArea() => width * width;

  @override
  double calculatePerimeter() => 4 * width;

  @override
  void printDetails(Function(String) logCallback) {
    logCallback(
        'Square: width = $width, area = ${calculateArea()}, perimeter = ${calculatePerimeter()}');
  }
}

class Rectangle extends Shape {
  final double _width, _height;

  Rectangle(this._width, this._height) {
    if (_width <= 0 || _height <= 0) {
      throw ArgumentError('Width and height must be positive');
    }
  }

  double get getWidth => _width;

  double get getHeight => _height;

  @override
  double calculateArea() => _width * _height;
}

class Circle extends Shape {
  static const double pi = 3.14;
  double radius;

  Circle(this.radius) {
    if (radius <= 0) {
      throw ArgumentError('Radius cannot be negative or zero');
    }
  }

  @override
  double calculateArea() => pi * radius * radius;

  static double calculateCircumference(double radius) => 2 * pi * radius;
}

/// 2. Interface и Mixin

abstract class PerimeterCalculation {
  double calculatePerimeter();
}

mixin PrintDetailsMixin {
  void printDetails(Function(String) logCallback);
}

/// 3. Abstract Class

abstract class Shape3D {
  double calculateVolume();
}

class Cube extends Shape3D with PrintDetailsMixin {
  double side;

  Cube(this.side) {
    if (side <= 0) {
      throw ArgumentError('Side must be positive');
    }
  }

  @override
  double calculateVolume() => pow(side, 3).toDouble();

  @override
  void printDetails(Function(String) logCallback) {
    logCallback('Cube: side = $side, volume = ${calculateVolume()}');
  }
}

class Sphere extends Shape3D with PrintDetailsMixin {
  double radius;

  Sphere(this.radius) {
    if (radius <= 0) {
      throw ArgumentError('Radius cannot be negative or zero');
    }
  }

  @override
  double calculateVolume() => (4 / 3) * Circle.pi * pow(radius, 3);

  @override
  void printDetails(Function(String) logCallback) {
    logCallback('Sphere: radius = $radius, volume = ${calculateVolume()}');
  }
}
