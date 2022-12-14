import 'package:flutter/material.dart';
import '../../../../layout/navBar.dart';

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
        appBar: NavBar(title: widget.situacionActual.codigo),
        body: Column(
          children: [
            Container(
                width: 450,
                height: 350,
                //padding: EdgeInsets.all(50.0),
                child: Image.network(widget.situacionActual.telefono)),
            Container(
                child: Text(widget.situacionActual.apellido,
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
                widget.situacionActual.estado,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.normal,
                color: Colors.orange.shade900),
              ),
              
              //Theme.of(context).textTheme.labelMedium,
            ),
            Container(
              child: Text(
                widget.situacionActual.voluntario,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.normal,
                color: Colors.orange.shade900),
              ),
              
              //Theme.of(context).textTheme.labelMedium,
            ),
            Container(
              child: Text(
                widget.situacionActual.titulo,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.normal,
                color: Colors.orange.shade900),
              ),
              
              //Theme.of(context).textTheme.labelMedium,
            ),
            Container(
              child: Text(
                widget.situacionActual.comentario,
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




