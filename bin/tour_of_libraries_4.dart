library tour_of_libraries_4;

import 'dart:io';
import 'dart:convert';
//import 'dart:async';

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
  
  // Writing file contents
  var out = config.openWrite(mode: FileMode.APPEND, encoding: Encoding.getByName('UTF-8'));
  out.write('\nFILE ACCESSED ${new DateTime.now()}');
  out.close();
  
  // Listing files in a directory
  var dir = new Directory('../bin');
  dir.list(recursive: true).forEach((item) => print(item));
}