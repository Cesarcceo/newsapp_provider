import 'package:flutter/material.dart';

import 'package:newsapp_provider/src/models/models.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  const ListaNoticias({super.key, required this.noticias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index) {


        return _Noticia(noticia: noticias[index], index: index);
      },
    );
  }
}

class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        _TarjetaTopBar(noticia: noticia,index: index),

        _TarjetaTitulo(noticia: noticia),

        _TarjetaImagen(noticia: noticia),

        _TArjetaBody(noticia: noticia),

        _TarjetaBotones(),

        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  
  final Article noticia;
  final int index;

  const _TarjetaTopBar({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${ index + 1 }. ', style: const TextStyle(color: Colors.red),),
          Text('${ noticia.source.name }. ')
        ],
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {

  final Article noticia;

  const _TarjetaTitulo({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title, style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w700)),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {

  final Article noticia;

  const _TarjetaImagen({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: noticia.urlToImage != null
          ? FadeInImage(
            placeholder: const AssetImage('assets/giphy.gif'),
            image: NetworkImage(noticia.urlToImage),
          )
          : const Image(image: AssetImage('assets/no-image.png'))
      ),
    );
  }
}

class _TArjetaBody extends StatelessWidget {

  final Article noticia;

  const _TArjetaBody({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(noticia.description ?? '')
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.red,
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.star_border),
        ),
    
        const SizedBox(width: 10),
    
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.indigo,
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.more),
        ),
      ],
    );
  }
}