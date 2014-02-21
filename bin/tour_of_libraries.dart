library tour_of_libraries;

void main() {
  print(int.parse('42') == 42);
  print(double.parse('0.50') == 0.5);
  
  // Convert an int to a string.
  print(42.toString() == '42');
  
  // Convert a double to a string.
  print(123.456.toString() == '123.456');
  
  // Specify the number of digits after the decimal.
  print(123.456.toStringAsFixed(2) == '123.46');
  
  // Specify the number of significant figures.
  print(123.456.toStringAsPrecision(2) == '1.2e+2');
  print(double.parse('1.2e+2') == 120.0);
  
  
  // Check whether a string contains another string.
  print('Never odd or even'.contains('odd'));
  
  // Does a string start with another string?
  print('Never odd or even'.startsWith('Never'));
  
  // Does a string end with another string?
  print('Never odd or even'.endsWith('even'));
  
  // Find the location of a string inside a string.
  print('Never odd or even'.indexOf('odd') == 6);
  
  // Grab a substring.
  print('Never odd or even'.substring(6, 9) == 'odd');
  
  // Split a string using a string pattern.
  var parts = 'structured web apps'.split(' ');
  print('length: ${parts.length}');
  print('parts[0]: ${parts[0]}');
  
  // Get the character (as a string) by index.
  print('Never odd or even'[0] == 'N');
  
  // Use splitChars() to get a list of all characters (as Strings);
  // good for iterating.
  for (var char in 'hello'.split('')) {
    print(char);
  }
  
  // Get the char code at an index
  print("The char's code is ${'Never odd or even'.codeUnitAt(0)}");
  
  // Get all the char codes as a list of integers.
  var charCodes = 'Never odd or even'.codeUnits;
  print('length of charCodes: ${charCodes.length}');
  print('The code of first char is ${charCodes[0]}');
  
  // Convert to uppercase.
  print('structured web apps'.toUpperCase());
  
  // Convert to lowercase.
  print('STRUCTURED WEB APPS'.toLowerCase());
  
  // Trim a string.
  print('  hello  '.trim());
  
  // Check whether a string is empty.
  print(''.isEmpty);
  
  // Strings with only white space are not empty.
  print(!'  '.isEmpty);
  
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(new RegExp('NAME'), 'Bob');
  print('greeting: $greeting and greetingTemplate: $greetingTemplate');

  // Building a string
  var sb = new StringBuffer();
  sb.write('Use a StringBuffer ');
  sb.writeAll(['for ', 'efficient ', 'string ', 'creation ']);
  sb.write('if you are ');
  sb.write('building lots of strings.');
  
  var fullString = sb.toString();
  print("fullString: $fullString");
  
  sb.clear();  // All gone!
  print(sb.toString() == '');
  
  // A regular expression for one or more digits
  var numbers = new RegExp(r'\d+');
  
  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';
  
  // Contains() can use a regular expression.
  print("Does 'allCharacters' contain numbers? " 
        "${allCharacters.contains(numbers)}");
  
  print("Does 'someDigits' contain numbers? "
        "${someDigits.contains(numbers)}");
  
  // Replace every match with another string.
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  print('exedOut: $exedOut');
  
  // Check whether the reg exp has a match in a string.
  print(numbers.hasMatch(someDigits));
  Iterable<Match> matches = numbers.allMatches(someDigits);
  
  // Loop through all matches.
  matches.forEach((match) => print(match.group(0)));
  
  // Use a List constructor.
  var vegetables = new List();
  
  // Or simply use a list literal.
  var fruits = ['apples', 'oranges'];
  
  // Add to a list.
  fruits.add('kiwis');
  
  // Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);
  
  // Get the list length
  print("The length of the list: ${fruits.length}");
  
  // Remove a single item.
  var appleIndex = fruits.indexOf("apples");
  fruits.removeAt(appleIndex);
  print("Now the length of the list: ${fruits.length}");
  
  // Remove all elements from a list.
  fruits.clear();
  print("Finally the length of the list: ${fruits.length}");
  
  var other_fruits = ['apples', 'oranges'];
  
  // Access a list item by index.
  print("The first item in 'other_fruits' is ${other_fruits[0]}");
  
  // Find an item in a list.
  print("'apples' is at index ${other_fruits.indexOf('apples')}");
  
  var third_fruits = ['bananas', 'apples', 'oranges'];
  
  // Sort a list.
  third_fruits.sort((a, b) => a.compareTo(b));
  print("The first item in 'third_fruits' is ${third_fruits[0]}");
  
  // This list should contain only strings.
  var last_fruits = new List<String>();
  
  last_fruits.add("apples");
  var fruit = last_fruits[0];
  print("The first item in 'last_fruits' is ${fruit}.");
  
  // Generates static analysis warning, num is not a string.
//  last_fruits.add(5); // BAD: Throws exception in checked mode.
  
  var ingredients = new Set();
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  print("The length of the set is ${ingredients.length}.");
  
  // Adding a duplicate item has no effect.
  ingredients.add('gold');
  print("The length of the set is still ${ingredients.length}.");
  
  // Remove an item from a set.
  ingredients.remove('gold');
  print("The length of the set is ${ingredients.length}.");
  
  
  ingredients.add('gold');
  
  // Check whether an item is in the set.
  print("Does the set contain the item 'titanium'?" 
        "${ingredients.contains('titanium')}");
  
  // Check whether all the items are in the set.
  print("Does the set contain items 'titanium' and 'xenon'?" 
      "${ingredients.containsAll(['titanium', 'xenon'])}");
  
  // Create the intersection of two sets.
  var nobleGases = new Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  print("The length of the intersection is ${intersection.length}");
  print("Does the intersection contain the item 'xenon'"
        "? ${intersection.contains('xenon')}");
  
  // Check whether this set is a subset of another collection.
  // That is, does another collection contains all the items of this set
  var allElements = new Set.from(['hydrogen', 'helium', 'lithium', 'beryllium',
                     'gold', 'titanium', 'xenon' /* all the rest */]);
  
  print("Is 'ingredients' subset of 'allElements'? "
        "${allElements.containsAll(ingredients)}");
  
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  teas.forEach((tea) => print('I drink $tea'));
  
  var loudTeas = teas.map((tea) => tea.toUpperCase());
  print(loudTeas.singleWhere((tea) => tea == 'GREEN'));
  
  // Chamomile is not caffeinated.
  isDecaffeinated(String teaName) => teaName == 'chamomile';
  
  // Use filter() to create a new collection with only the items
  // that return true from the provided function.
  var decaffeinatedTeas = teas.singleWhere((tea) => isDecaffeinated(tea));
  print(decaffeinatedTeas);
  // or teas.singleWhere(isDecaffeinated);
  
  // Use every() to check whether all the items in a collection
  // satisfy a condition.
  print(teas.every(isDecaffeinated));
  
  // Map literals use strings as keys.
  var hawaiianBeaches = {
    'oahu' : ['waikiki', 'kailua', 'waimanalo'],
    'big island' : ['wailea bay', 'pololu beach'],
    'kauai' : ['hanalei', 'poipu']
  };
  
  // Maps can be bulit from a constructor.
  var searchTerms = new Map();
  
  // Maps are parameterized types; you can specify what types
  // the key and value should be.
  nobleGases = new Map<int, String>();
  
  // Get all the keys as an unordered collection (a list).
  var keys = hawaiianBeaches.keys;
  print(keys.length);
  print(new Set.from(keys).contains('oahu'));
  
  // Get all the values as an unordered collection (a list of lists).
  var values = hawaiianBeaches.values;
  print(values.length);
  print(values.singleWhere((v) => v.indexOf('waikiki') != -1));
  
  // Iterate throuth the key-value pairs.
  // NOTE: Do not depend on iteration order.
  hawaiianBeaches.forEach((k,v) {
    print('I want to visit $k and swim at $v');
  });
  
  print(hawaiianBeaches.containsKey('oahu'));
  print(hawaiianBeaches.containsKey('florida'));
  
  var teamAssignments = {};
  teamAssignments.putIfAbsent('Catcher', () => true);
  print(teamAssignments['Catcher'] != null);
  
  // Dates and Times
  // Get the current date and time
  var now = new DateTime.now();
  
  // Create a new Date with the local time zone.
  var y2k = new DateTime(2000, 1, 1, 0, 0, 0, 0);
  
  // You can also use named parameters.
//  y2k = new DateTime(2000, month: 1, day: 1, hour: 0, minute: 0, 
//      second: 0, millisecond: 0);
  
  // Specify all the parts of a date as a UTC time.
  y2k = new DateTime.utc(2000, 1, 1, 0, 0, 0, 0);
  
  // Specify a UTC date and time in milliseconds since the Unix epoch
  y2k = new DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
}
