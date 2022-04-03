import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  String trivia = "error";
  Future<http.Response> getTrivia(int number) async {
    final response =
        await http.get(Uri.parse("http://www.numbersapi.com/$number"));
    if (response.statusCode == 200) {
      trivia = response.body;
    }
    return response;
  }
}
