import 'package:defensa_civil/layout/menu.dart';
import 'package:defensa_civil/layout/navbar.dart';
import 'package:flutter/material.dart';

class Albergues extends StatefulWidget {
  const Albergues({ Key? key }) : super(key: key);

  @override
  _AlberguesState createState() => _AlberguesState();
}

class _AlberguesState extends State<Albergues> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(title: "Albergues",),
      drawer: const Menu(),
      body: ListView(children: [
        Text("Albergues")
      ]),
    );
  }
}