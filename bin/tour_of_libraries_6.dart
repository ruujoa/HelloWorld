library tour_of_libraries_6;

import 'dart:convert';

void main() {
  // Encoding and Decoding Fully Qualified URIs
  var uri = 'http://example.org/api?foo=some message';
  var encoded = Uri.encodeFull(uri);
  print(encoded);
 
  var decoded = Uri.decodeFull(encoded);
  print(decoded == uri);
  
  // Encoding and Decoding URI Components
  encoded = Uri.encodeComponent(uri);
  print(encoded);
  
  decoded = Uri.decodeComponent(encoded);
  print(uri == decoded);
  
  // Parsing URIs
  uri = Uri.parse('http://example.org:8080/foo/bar#frag');
  print('full uri: $uri');
  print("schema: ${uri.scheme}");
  print("domain: ${uri.host}");
  print("path: ${uri.path}");
  print("fargment: ${uri.fragment}");
  print("origin: ${uri.origin}");
  
  // Decoding UTF-8 Characters
  var string = new Utf8Decoder();
  decoded = string.convert([0xc3, 0x8e, 0xc3, 0xb1, 0xc5, 0xa3, 0xc3, 0xa9,
                  0x72, 0xc3, 0xb1, 0xc3, 0xa5, 0xc5, 0xa3, 0xc3,
                  0xae, 0xc3, 0xb6, 0xc3, 0xb1, 0xc3, 0xa5, 0xc4,
                  0xbc, 0xc3, 0xae, 0xc5, 0xbe, 0xc3, 0xa5, 0xc5,
                  0xa3, 0xc3, 0xae, 0xe1, 0xbb, 0x9d, 0xc3, 0xb1]);
  print(decoded);
  
  // Encoding Strings to UTF-8 Bytes
  List<int> expected = [0xc3, 0x8e, 0xc3, 0xb1, 0xc5, 0xa3, 0xc3, 0xa9,
                        0x72, 0xc3, 0xb1, 0xc3, 0xa5, 0xc5, 0xa3, 0xc3,
                        0xae, 0xc3, 0xb6, 0xc3, 0xb1, 0xc3, 0xa5, 0xc4,
                        0xbc, 0xc3, 0xae, 0xc5, 0xbe, 0xc3, 0xa5, 0xc5,
                        0xa3, 0xc3, 0xae, 0xe1, 0xbb, 0x9d, 0xc3, 0xb1];
  
  encoded = new Utf8Encoder().convert('Îñţérñåţîöñåļîžåţîờñ');
  
  print(encoded.length == expected.length);
  for (int i = 0; i < encoded.length; i++) {
    print(encoded[i] == expected[i]);
  }
}