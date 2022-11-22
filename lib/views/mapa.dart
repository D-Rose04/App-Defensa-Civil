import 'package:defensa_civil/layout/menu.dart';
import 'package:defensa_civil/layout/navbar.dart';
import 'package:flutter/material.dart';

class Mapa extends StatefulWidget {
  const Mapa({ Key? key }) : super(key: key);

  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(title: "Mapa",),
      drawer: const Menu(),
      body: ListView(children: [
        Text("Mapa")
      ]),
    );
  }
}