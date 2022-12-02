import 'package:defensa_civil/layout/menu.dart';
import 'package:defensa_civil/layout/navbar.dart';
import 'package:flutter/material.dart';

class Historia extends StatelessWidget {
  const Historia({Key? key}) : super(key: key);

  //Comentario que sirve como prueba a la rama new-features-j

  @override
  // ignore: prefer_const_constructors
  Widget build(BuildContext context) => Scaffold(
        appBar: const NavBar(
          title: "Historia",
        ),
        drawer: const Menu(),
        body: ListView(children: [
          Image.network(
            "https://defensacivil.gob.do/images/slide/2021/logoNuevoDefensa.png",
            width: 180,
            height: 180,
          ),
          // ignore: prefer_const_constructors
          Text(
            "\nHistoria defensa civil\n",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          // ignore: prefer_const_constructors
          Text(
            "Antes del año 1966, cuando llegaba la temporada de huracanes, un grupo de radioaficionados se reunía en la Cruz Roja para estar atentos por si surgía algún tipo de emergencia, inmediatamente ponerse a disposición y ayudar en todo lo posible, inclusive, usando sus propios equipos de comunicación para así tener contacto con el exterior en caso de que las redes telefónicas resultaran afectadas.",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.justify,
          ),
          // ignore: prefer_const_constructors
          Text(
            "\nAl surgir el triunvirato fue designado el Dr. Rafael Cantizano Arias, como presidente de la Cruz Roja y al mismo tiempo nombraron al Ing. Carlos D´ Franco como director de la Defensa Civil, quien con un grupo compuesto por seis personas, se instaló en la calle Francia esquina Galván, siendo esa la primera oficina de la Defensa Civil.",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.justify,
          ),
          // ignore: prefer_const_constructors
          Text(
            "\nAl surgir el Gobierno Provisional, presidido por el Dr. Héctor García Godoy, a los diecisiete días del mes de junio de 1966, fue promulgada la Ley 257, mediante la cual fue creada la Defensa Civil, institución dependiente de la Secretaría Administrativa de la Presidencia (ahora Ministerio de la Presidencia) y quien en la actualidad preside la Comisión Nacional de Emergencias.",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.justify,
          ),
          // ignore: prefer_const_constructors
          Text(
            "\nMás adelante, el local fue trasladado a la calle Dr. Delgado No. 164 y luego en la gestión del Contralmirante Radhamés Lora Salcedo se reubicó a la Plaza de la Salud, donde aún permanece.",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.justify,
          ),
        ]),
      );
}
