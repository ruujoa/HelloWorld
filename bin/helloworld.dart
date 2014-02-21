import 'dart:math' show sqrt;
import 'togo.dart';

void main() {
  print("Hello, World!");
  var number = 42;          // Declare and initialize a variable.
  printNumber(number);      // Call a function.
  
  var name = 'Bob';
  
  if (name != null) {
    print('You have a name!');
  }
  
  
  if (1 > 1) {
    print('JavaScript prints this line because it thinks 1 is true');
  } else {
    print('Dart in production mode prints this line.');
  }
  
  var add2 = makeAdder(2); // Create a function that adds 2.
  var add4 = makeAdder(4); // Create a function that adds 4.
  
  assert(add2(3) == 5);
  assert(add4(3) == 7);
  
  var command = 'OPEN';
  switch (command) {
    case 'OPEN':
      // print('Something wrong will happen');
      // ERROR: Missing break causes an exception to be thrown!!
    case 'CLOSED':
      break;
  }
  
  var point = new Point(4, 6);
//  point.x = 4;
//  point.y = 10;
  print("(${point.x}, ${point.y})");
  
  var emp = new Employee.fromJson({});
  
  var logger1 = new Logger('UI');
  logger1.log('Button clicked');
  var logger2 = new Logger('UI');
  
  var rect = new Rectangle(3, 4, 20, 15);
  print("left: ${rect.left}");
  rect.right = 23;
  print("left: ${rect.left}");
  
  final v = new Vector(2, 3);
  final w = new Vector(2, 2);
  
  print("v.x = ${v.x}, v.y = ${v.y}");
  print("(v+w).x = ${(v+w).x}, (v+w).y = ${(v+w).y}");
  print("(v-w).x = ${(v-w).x}, (v-w).y = ${(v-w).y}");
  
  var container = new SpecializedContainer();
  
  print(greetBob(new Person('kathy')));
  print(greetBob(new Imposter()));
  
  print('Color: ${Color.RED.name}');
  var a = new Point(2, 2);
  var b = new Point(4, 4);
  print('distance: ${Point.distanceBetween(a, b)}');
  
  hello();
//  goodbye();
}

// Define a function.
printNumber(num aNumber) {
  print('The number is $aNumber.');
}

/// Returns a function that adds [n] to the function's argument.
Function makeAdder(num n) {
  return (num i) => n + i;
}

class Point {
  num x;
  num y;
  
  /*
  Point(num x, num y) {
    // There's a better way to do this, stay tuned.
    this.x = x;
    this.y = y;
  }*/
  
  // more handy way
  Point(this.x, this.y);
  
  // Initializer list sets instance variables before the constructor body runs.
  Point.fromJson(Map json) : x = json['x'], y = json['y'] {
    print('In Point.fromJson(): ($x, $y)');                                                
  }
  
  Point.alongXAxis(num x) : this(x, 0); // Delegates to the main constructor.

  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
  
  // a static method
  static num distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}

class Person {
  Person.fromJson(Map data) {
    print('in Person');
  }
  
  final _name; // In the interface, but visible only in this library,
  Person(this._name); // Not in the interface, since this is a constructor.
  String greet(who) => 'Hello, $who, I am $_name.'; // In the interface.
}

// An implementation of the Person interface.
class Imposter implements Person {
  final _name = "";      // We have to define this, but we don't use it.
  String greet(who) => 'Hi $who. Do you know who I am?';
}

greetBob(Person person) => person.greet('bob');

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
}

// Constant constructors
class ImmutablePoint {
  final num x;
  final num y;
  const ImmutablePoint(this.x, this.y);
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);
}

// Factory constructors
class Logger {
  final String name;
  bool mute = false;
  
  // _cache is library-private, thanks to the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};
  
  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      print('There is already an instance named $name.');
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }
  
  Logger._internal(this.name);
  
  void log(String msg) {
    if(!mute) {
      print(msg);
    }
  }
}


// getter & setter
class Rectangle {
  num left;
  num top;
  num width;
  num height;
  
  Rectangle(this.left, this.top, this.width, this.height);
  
  // Define two calculated properties: right and bottom.
  num get right             => left + width;
      set right(num value)  => left = value - width;
  num get bottom            => top + height;
      set bottom(num value) => top = value - height;
}

// Operators overriding
class Vector {
  final int x;
  final int y;
  const Vector(this.x, this.y);
  
  Vector operator +(Vector v) { // Overrides + (a + b).
    return new Vector(x + v.x, y + v.y);
  }
  
  Vector operator -(Vector v) { // Overrides - (a - b).
    return new Vector(x - v.x, y - v.y);
  }
}

// This class is declared abstract and thus can't be instantiated.
abstract class AbstractContainer {
  // ...Define constructors, fields, methods...
  
  void updateChildren(); // Abstract method.
}

// The following class isn't abstract
class SpecializedContainer extends AbstractContainer {
  // ...Define more constructors, fields, methods...
  void updateChildren() {
    // ...Implement updateChildren()...
  }
  
  // Abstract method causes a warning but doesn't prevent instantiatation.
  void doSomething();
}

// extending a class
class Television {
  void turnOn() {
    _illuminateDisplay();
    _activateIrSensor();
  }
}

class SmartTelevision extends Television {
  void turnOn() {
    super.turnOn();
    _bootNetworkInterface();
    _initializeMemory();
    _upgradeApps();
  }
}

// Class Variables and Methods
class Color {
  static const RED = const Color('red');  // A constant static variable.
  final String name;
  const Color(this.name);
}