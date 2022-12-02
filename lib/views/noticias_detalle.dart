import 'package:defensa_civil/layout/menu.dart';
import 'package:flutter/material.dart';

import '../models/noticias_model.dart';

class NoticiasDetalle extends StatefulWidget {
  const NoticiasDetalle({Key? key, required this.noticia}) : super(key: key);
  final NoticiasModel noticia;
  @override
  _NoticiasDetalleState createState() => _NoticiasDetalleState();
}

class _NoticiasDetalleState extends State<NoticiasDetalle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 300,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.noticia.foto), fit: BoxFit.cover)),
        ),
      ),
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 5),
          margin: const EdgeInsets.only(top: 10),
          child: Text(widget.noticia.titulo,textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineSmall,),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(widget.noticia.contenido,textAlign: TextAlign.justify,),
        )
      ]),
    );
  }
}
