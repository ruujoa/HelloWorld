library tour_of_libraries_4;

import 'dart:io';
import 'dart:convert';

void main() {
  var config = new File('config.txt');
  
  // Put the whole file in a single string.
  config.readAsString(encoding: Encoding.getByName('UTF-8')).then((String contents) {
    print('The entire file is ${contents.length} characters long.');
  });
  
  // Put each line of the file into its own string.
  config.readAsLines(encoding: Encoding.getByName('UTF-8')).then((List<String> lines) {
    print('The entire file is ${lines.length} lines long.');
  });
  
  // Reading a file as binary
  config.readAsBytes().then((List<int> contents) {
    print('The entire file is ${contents.length} bytes long.');
  });
}