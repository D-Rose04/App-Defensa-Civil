import 'package:flutter/material.dart';

import '../layout/menu.dart';
import '../layout/navbar.dart';

class Voluntario extends StatefulWidget {
  const Voluntario({ Key? key }) : super(key: key);

  @override
  _VoluntarioState createState() => _VoluntarioState();
}

class _VoluntarioState extends State<Voluntario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: "Voluntariado",),
      drawer: const Menu(),
      body: ListView(children: [
        Text("Quiero ser Voluntario")
      ]),
    );
  }
}