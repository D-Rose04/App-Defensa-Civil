import 'package:flutter/material.dart';
import '../../../../layout/navBar.dart';

//id,volun,titulo,descrip,foto,fecha
class SituacionDetalles extends StatefulWidget {
  const SituacionDetalles({Key? key, this.situacionActual}) : super(key: key);
  final situacionActual;

  @override
  _SituacionDetallesState createState() => _SituacionDetallesState();
}

class _SituacionDetallesState extends State<SituacionDetalles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: NavBar(title: widget.situacionActual.titulo),
        body: ListView(children: [
          Container(
            padding: const EdgeInsets.all(10.0),
          ),
          Container(
              child: CircleAvatar(
            radius: 116,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 113.5,
              backgroundImage: NetworkImage(widget.situacionActual.foto),
            ),
          )),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              widget.situacionActual.titulo,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange.shade900,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            //margin: EdgeInsets.all(1),
            child: Text(
              'Fecha de reporte:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(0.5),
            child: Text(
              '\n${widget.situacionActual.fecha}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange.shade900,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              'Estado',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              widget.situacionActual.estado,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange.shade900,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              'Descripcion',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              widget.situacionActual.descripcion,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange.shade900,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]));
  }
}
