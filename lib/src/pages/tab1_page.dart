import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:newsapp_provider/src/services/news_service.dart';
import 'package:newsapp_provider/src/widgets/widgets.dart';


class Tab1Page extends StatelessWidget {
  const Tab1Page({super.key});

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: ListaNoticias(noticias: newsService.headlines),
   );
  }
}