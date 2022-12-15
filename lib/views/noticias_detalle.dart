import 'package:defensa_civil/layout/menu.dart';
import 'package:defensa_civil/layout/navbar.dart';
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
      backgroundColor: Colors.blue.shade900,
      body: ListView(children: [
        Stack(children: [
          Container(
            child: Image(
              image: NetworkImage(widget.noticia.foto),
              fit: BoxFit.cover,
            ),
            height: 350,
          ),
          AppBar(
            backgroundColor: Color.fromARGB(0, 255, 255, 255),
          ),
        ]),
        Container(
          padding:
              const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 5),
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            widget.noticia.titulo,
            textAlign: TextAlign.center,
            style: TextStyle(

                color: Colors.orange.shade900,
                color: Colors.blue.shade900,

                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            widget.noticia.contenido,
            textAlign: TextAlign.justify,

            style: TextStyle(
                      color: Colors.white,)
          ),
        )
      ]),
    );
  }
}
