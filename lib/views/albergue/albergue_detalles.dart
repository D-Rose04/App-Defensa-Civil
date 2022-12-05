import 'package:defensa_civil/views/mapa.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../layout/navBar.dart';

class AlbergueDetalles extends StatefulWidget {
  const AlbergueDetalles({Key? key, this.albergueActual}) : super(key: key);
  final albergueActual;
  @override
  _AlbergueDetallesState createState() => _AlbergueDetallesState();
}

class _AlbergueDetallesState extends State<AlbergueDetalles> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(
                right: 10,
              ),
              child: Column(children: [
                //Icono, nombre y ciudad
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 35),
                      child: Icon(
                        Icons.house,
                        size: 120,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          width: 180,
                          child: Text(
                            widget.albergueActual.edificio,
                            overflow: TextOverflow.visible,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 180,
                          child: Text(
                            widget.albergueActual.ciudad,
                            overflow: TextOverflow.visible,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                // Aqui se define el mapa
                Container(
                  height: 200,
                  width: 300,
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Mapa(coords: [widget.albergueActual]),
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
                            "CODIGO:",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            "COORDINADOR:",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            "TELEFONO:",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            "CAPACIDAD:",
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
                                widget.albergueActual.codigo.toUpperCase(),
                                style: Theme.of(context).textTheme.labelLarge)),
                        Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                                widget.albergueActual.coordinador.toUpperCase(),
                                style: Theme.of(context).textTheme.labelLarge)),
                        Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(widget.albergueActual.telefono,
                                style: Theme.of(context).textTheme.labelLarge)),
                        Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              widget.albergueActual.capacidad!.toUpperCase(),
                              style: Theme.of(context).textTheme.labelLarge,
                            )),
                      ],
                    )
                  ],
                )
              ]))
        ],
      );
  }

  Future call() async {
    if (!await launchUrl(
        Uri(scheme: "tel", path: widget.albergueActual.telefono))) {
      throw "No se puede encontrar el telefono";
    }
  }
}
