import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:newsapp_provider/src/models/models.dart';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];
  String _selectedCategory= 'business';

  List<Category> categories = [
    Category(icon: FontAwesomeIcons.building, name: 'business'),
    Category(icon: FontAwesomeIcons.tv, name: 'entertainment'),
    Category(icon: FontAwesomeIcons.addressCard, name: 'general'),
    Category(icon: FontAwesomeIcons.headSideVirus, name: 'health'),
    Category(icon: FontAwesomeIcons.vials, name: 'science'),
    Category(icon: FontAwesomeIcons.volleyball, name: 'sports'),
    Category(icon: FontAwesomeIcons.memory, name: 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  final String _urslNews ='newsapi.org';
  final String _apiKey ='fe63f44e04044c2bb5c0ee0f8e0e0b9c';
  final String _country ='mx';


  NewsService() {
    getTopHeadLines();

    categories.forEach((element) {
      categoryArticles[element.name] = List.empty(growable: true);
    });
  }

  String get selectedCategory => _selectedCategory;
  set selectedCategory (dynamic valor){
    _selectedCategory = valor;

    getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article>? get getArticulosCategotriaSeleccionada => categoryArticles[selectedCategory]!;

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

  getArticlesByCategory( String category ) async {

    if (categoryArticles[category]!.length > 0){
      return categoryArticles[category];
    }
    final url = Uri.https(_urslNews, '/v2/top-headlines', {
      'apiKey': _apiKey,
      'country': _country,
      'category': _selectedCategory,
    });
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromRawJson(resp.body);
    categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }
}