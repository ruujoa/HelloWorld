library tour_of_libraries_2;

import 'dart:async' show Future, Completer;

void main() {
  var short = const Line(1);
  var long = const Line(100);
  print(short.compareTo(long) < 0);
  
  var p1 = new Person('bob', 'smith');
  var p2 = new Person('bob', 'smith');
  print(p1.hashCode == p2.hashCode);
  
  // Objects that implement Iterable can be used with for-in.
  /*
  for(var process in new Processes()) {
    // Do something with the process.
  }
  */
  var result = longExpensiveSearch(); // Returns immediately.
  
  // result.then() returns immediately.
  result.then((success) {
    // The following code executes when the operation is complete.
    print('The item was found: $success');
  });
}

class Line implements Comparable {
  final length;
  const Line(this.length);
  int compareTo(Line other) => length - other.length;
}

class Person {
  String firstName, lastName;
  
  Person(this.firstName, this.lastName);
  
  // Override hashCode using strategy from Effective Java, Chapter 11.
  int get hashCode {
    int result = 11;
    result = 37 * result + firstName.hashCode;
    result = 37 * result + lastName.hashCode;
    return result;
  }
  
  // Always implement operator== if you override hashCode.
  bool operator==(other) {
    if (identical(other, this)) return true;
    return (other.firstName == firstName && other.lastName == lastName);
  }
}

class Process {
  // Represents a process...
}

class ProcessIterator implements Iterator<Process> {
  Process next() {
    // Return the next process if possible; but if not:
    throw new Exception('No more elements...');
  }
  
  bool hasNext() {
    // True if calling() next() would return a process
    return false;
  }
}

// A mythical class that lets you iterate through all processes.
class Processes implements Iterable<Process> {
  Iterator<Process> get iterator {
    return new ProcessIterator();
  }
}

Future<bool> longExpensiveSearch() {
  var completer = new Completer();
  
  // Perform exhaustive search.
  // ...
  // Sometime later,
  // found it!!
  completer.complete(true);
  return completer.future;
}

class FooException implements Exception {
  final String msg;
  const FooException([this.msg]);
  String toString() => msg == null ? 'FooException' : msg;
}