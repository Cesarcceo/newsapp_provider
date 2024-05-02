import 'package:flutter/material.dart';
import 'package:newsapp_provider/src/models/models.dart';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];

  NewsService() {
    getTopHeadLines();
  }

  getTopHeadLines(){
    print ('cargando headlines...');
  }
}