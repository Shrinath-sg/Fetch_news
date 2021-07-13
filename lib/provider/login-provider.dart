import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  // String _token;
  // DateTime _expiryDate;
  // String _userId;

  Future<void> _authenticate(
      String email, String password,) async {
    try {
      final url =
      Uri.parse('https://www.getpostman.com/collections/299632c9a18ed457ba78');
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            // 'returnSecureToken': true,
          },
        ),
        headers: {
          'Content-Type': 'application/json',
          'Charset': 'utf-8'
        }
      );
      var statusCode=response.statusCode;
      print(statusCode);
      print('****************');
      print(json.decode(response.body));
      notifyListeners();
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password);
  }

  Future<void> signin(String email, String password) async {
    return _authenticate(email, password);
  }
}

