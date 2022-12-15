import 'package:flutter/material.dart';
import '../../layout/navBar.dart';

class ServicioDetalles extends StatefulWidget {
  const ServicioDetalles({Key? key, this.servicioActual}) : super(key: key);
  final servicioActual;

  @override
  _ServicioDetallesState createState() => _ServicioDetallesState();
}

class _ServicioDetallesState extends State<ServicioDetalles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: NavBar(title: widget.servicioActual.nombre),
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
              backgroundImage: NetworkImage(widget.servicioActual.foto),
            ),
          )
              // width: 450,
              // height: 350,
              // padding: EdgeInsets.all(10.0),
              //child: Image.network(widget.servicioActual.foto)
              ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              widget.servicioActual.nombre,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange.shade900,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              widget.servicioActual.descripcion,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]));
  }
}
