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
        appBar: NavBar(title: widget.servicioActual.voluntario),
        body: Column(
          children: [
            Container(
                width: 450,
                height: 350,
                //padding: EdgeInsets.all(50.0),
                child: Image.network(widget.servicioActual.descripcion)),
            Container(
                child: Text(widget.servicioActual.voluntario,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
            ),
            Container(
              child: Text(
                widget.servicioActual.titulo,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.normal,
                color: Colors.orange.shade900),
              ),
              
              //Theme.of(context).textTheme.labelMedium,
            )
          ],
        ));
  }
}
