import 'dart:math';
import 'dart:ui';

import 'package:defensa_civil/layout/menu.dart';
import 'package:defensa_civil/layout/navbar.dart';
import 'package:flutter/material.dart';

class Historia extends StatelessWidget {
  const Historia({Key? key}) : super(key: key);

  @override
  // ignore: prefer_const_constructors
  Widget build(BuildContext context) => Scaffold(
        appBar: NavBar(
          title: "Historia",
        ),
        drawer: const Menu(),
        body: ListView(children: [
          Container(
            margin: const EdgeInsets.all(2.0),
            child: Image.asset(
              "images/logo.png",
              width: 180,
              height: 180,
            ),
          ),
          // ignore: prefer_const_constructors
          Text(
            "Historia defensa civil",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          // ignore: prefer_const_constructors
          Center(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(children: const [
                Text(
                  "Antes del año 1966, cuando llegaba la temporada de huracanes, un grupo de radioaficionados se reunía en la Cruz Roja para estar atentos por si surgía algún tipo de emergencia, inmediatamente ponerse a disposición y ayudar en todo lo posible, inclusive, usando sus propios equipos de comunicación para así tener contacto con el exterior en caso de que las redes telefónicas resultaran afectadas.",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "\nAl surgir el triunvirato fue designado el Dr. Rafael Cantizano Arias, como presidente de la Cruz Roja y al mismo tiempo nombraron al Ing. Carlos D´ Franco como director de la Defensa Civil, quien con un grupo compuesto por seis personas, se instaló en la calle Francia esquina Galván, siendo esa la primera oficina de la Defensa Civil.",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "\nAl surgir el Gobierno Provisional, presidido por el Dr. Héctor García Godoy, a los diecisiete días del mes de junio de 1966, fue promulgada la Ley 257, mediante la cual fue creada la Defensa Civil, institución dependiente de la Secretaría Administrativa de la Presidencia (ahora Ministerio de la Presidencia) y quien en la actualidad preside la Comisión Nacional de Emergencias.",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "\nMás adelante, el local fue trasladado a la calle Dr. Delgado No. 164 y luego en la gestión del Contralmirante Radhamés Lora Salcedo se reubicó a la Plaza de la Salud, donde aún permanece.",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.justify,
                ),
              ]),
            ),
          )
        ]),
      );
}
