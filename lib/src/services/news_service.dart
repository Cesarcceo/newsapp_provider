import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:newsapp_provider/src/models/models.dart';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];

  final String _urslNews ='newsapi.org';
  final String _apiKey ='fe63f44e04044c2bb5c0ee0f8e0e0b9c';
  final String _country ='mx';


  NewsService() {
    getTopHeadLines();
  }

  getTopHeadLines() async {
    final url = Uri.https(_urslNews, '/v2/top-headlines', {
      'apiKey': _apiKey,
      'country': _country
    });
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromRawJson(resp.body);
    headlines.addAll(newsResponse.articles);

    notifyListeners();
  }
}