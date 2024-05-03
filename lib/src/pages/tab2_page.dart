import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:newsapp_provider/src/widgets/widgets.dart';
import 'package:newsapp_provider/src/models/category_model.dart';
import 'package:newsapp_provider/src/services/news_service.dart';


class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            _Listacategorias(),

            Expanded(child: ListaNoticias(noticias: newsService.getArticulosCategotriaSeleccionada!))

          ],
        )
      ),
    );
  }
}

class _Listacategorias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 90,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){
          final name2 = categories[index].name;
          return SizedBox(
            width: 108,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _CategoryButton(categoria: categories[index]),
                  const SizedBox(height: 5),
                  Text ('${name2[0].toUpperCase()}${name2.substring(1)}'),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

  final Category categoria;

  const _CategoryButton({required this.categoria});

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: (){
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory=categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          categoria.icon,
          color: (newsService.selectedCategory == categoria.name)
            ? Colors.red
            : Colors.black54
        ),
      ),
    );
  }
}