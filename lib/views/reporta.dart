import 'dart:html';

import 'package:defensa_civil/views/reporta_tools/textformfield_edited.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../layout/menu.dart';
import '../layout/navbar.dart';

class Reporta extends StatefulWidget {
  const Reporta({Key? key}) : super(key: key);

  @override
  _ReportaState createState() => _ReportaState();
}

Ingrese nombre = new Ingrese("hola");

class _ReportaState extends State<Reporta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: "Reportar situación"),
      drawer: const Menu(),
      body: ListView(children: [
        Column(
          children: [
            nombre.GenerarField(),
          ],
        )
      ]),
    );
  }
}
