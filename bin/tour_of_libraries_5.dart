library tour_of_libraries_5;

import "dart:convert";

void main() {
  // NOTE: Be sure to use double quotes("), not single quotes('),
  // inside the JSON string. This string is JSON, not Dart.
  
  /* Decoding JSON */ 
  var jsonString = '''
  [
    {"score": 40},
    {"score": 80}
  ]
  ''';
  
  var scores = JSON.decode(jsonString);
  print(scores is List);
  
  var firstScore = scores[0];
  print(firstScore is Map);
  print(firstScore['score']);
  
  /* Encoding JSON */
  scores = [
    {'score': 40},
    {'score': 80},
    {'score': 100, 'overtime': true, 'special_guest': null}
  ];
  
  var jsonText = JSON.encode(scores);
  print(jsonText.toString());
}