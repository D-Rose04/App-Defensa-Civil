import 'package:defensa_civil/layout/menu.dart';
import 'package:defensa_civil/layout/navbar.dart';
import 'package:flutter/material.dart';

class Servicios extends StatefulWidget {
  const Servicios({ Key? key }) : super(key: key);

  @override
  _ServiciosState createState() => _ServiciosState();
}

class _ServiciosState extends State<Servicios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: "Servicios",),
      drawer: Menu(),
      body: ListView(
        children: [
          Text("Servicios")
        ]
      ),
    );
  }
}