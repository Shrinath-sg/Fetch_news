import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:task/news_data_model.dart';

class NewsListProvider with ChangeNotifier {
  late var response;
  final url = Uri.parse('https://api.first.org/data/v1/news');

  Future<NewsDataModel> fetchData() async {
    try {
      notifyListeners();
      return await http
          .get(url,
              headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'})
          .then((rowData) => json.decode(rowData.body))
          .then((value) => response = value);
      // var statusCode=response.statusCode;
      // print(statusCode);
      // print('****************');
      //print(json.decode(response.body));

    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
    return response;
  }
}

class LoadData {
  final url = Uri.parse('https://api.first.org/data/v1/news');

  Future<NewsDataModel> load() async {
    var result = await http.get(url);
    final response = json.decode(result.body);
    print(response);
    return response;
  }
}
