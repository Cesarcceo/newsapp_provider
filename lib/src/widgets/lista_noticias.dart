import 'package:flutter/material.dart';
import 'package:newsapp_provider/src/models/models.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  const ListaNoticias({required this.noticias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(noticias[index].title);
      },
    );
  }
}