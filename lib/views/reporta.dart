import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../layout/menu.dart';
import '../layout/navbar.dart';

class Reporta extends StatefulWidget {
  const Reporta({Key? key}) : super(key: key);

  @override
  _ReportaState createState() => _ReportaState();
}

class _ReportaState extends State<Reporta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: "Reportar situación"),
      drawer: Menu(),
      body: ListView(children: [Text("Reporta")]),
    );
  }
}
