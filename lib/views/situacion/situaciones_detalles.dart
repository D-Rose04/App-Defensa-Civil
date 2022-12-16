import 'dart:convert';

import 'package:defensa_civil/models/situacion_model.dart';
import 'package:defensa_civil/views/situacion/mapa_situaciones.dart';
import 'package:flutter/material.dart';
import '../../../../layout/navBar.dart';

//id,volun,titulo,descrip,foto,fecha

class SituacionDetalles extends StatefulWidget {
  SituacionDetalles({Key? key, required this.situacionActual})
      : super(key: key);
  final SituacionModel situacionActual;

  @override
  _SituacionDetallesState createState() => _SituacionDetallesState();
}

class _SituacionDetallesState extends State<SituacionDetalles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(title: widget.situacionActual.titulo),
        body: ListView(
          children: [
            Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                child: Column(children: [
                  //Icono, nombre y ciudad
                  // Aqui se define el mapa
                  Container(
                    height: 200,
                    width: 300,
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: MapaSituaciones(coords: [widget.situacionActual]),
                    ),
                  ),
                  // Aqui van los detalles
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              "ESTADO:",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              "TITULO:",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              "DESCRIPCIÓN:",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              "FECHA:",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                  widget.situacionActual.estado.toUpperCase()
                                      .toUpperCase(),
                                  style:
                                      Theme.of(context).textTheme.labelLarge)),
                          Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                  widget.situacionActual.titulo.toUpperCase()
                                      .toUpperCase(),
                                  style:
                                      Theme.of(context).textTheme.labelLarge)),
                          Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(widget.situacionActual.descripcion.toUpperCase(),
                                  style:
                                      Theme.of(context).textTheme.labelLarge)),
                          Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                widget.situacionActual.fecha,
                                style: Theme.of(context).textTheme.labelLarge,
                              )),
                        ],
                      )
                    ],
                  )
                ]))
          ],
        ));
  }
}
