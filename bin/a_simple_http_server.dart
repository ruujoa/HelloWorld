library simple_http;

import 'dart:io';

void main() {
  dartHandler(HttpRequest request, HttpResponse response) {
    print('New request');
    response.write('Dart is optionally typed');
    response.close();
  }
  
  HttpServer.bind('127.0.0.1', 8888).then((server) {
    server.listen((HttpRequest request) {
      if (request.uri.path.contains('/languages/dart')) {
        request.response.write("Dart is optionally typed");
      } else {
        try {
          throw 'Bad Request!';
        } catch (e) {
          print('Something wrong really happens: $e');
        }
      }
      request.response.close();
    });
  });
}