library tour_of_libraries_3;

import 'dart:math' as math;

void main() {
  // Cosine
  print(math.cos(math.PI));
  
  // Sine
  var degrees = 30;
  var radians = degrees * (math.PI / 180);
  var sinOf30degrees = math.sin(radians);
  print("sinOf30degrees: $sinOf30degrees");
  
  // Truncate the decimal places to 2.
  print("truncated sinOf30degrees: "
        "${double.parse(sinOf30degrees.toStringAsPrecision(2))}");
  
  // Random Numbers
  var random = new math.Random();
  print(random.nextDouble());  // Between 0.0 and 1.0: [0, 1)
  print(random.nextInt(10)); // Between 0 and 9.
  
  print(random.nextBool());
}