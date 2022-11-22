import 'package:flutter/material.dart';

import '../layout/menu.dart';
import '../layout/navbar.dart';

class Noticias extends StatefulWidget {
  const Noticias({ Key? key }) : super(key: key);

  @override
  _NoticiasState createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(title: "Noticias",),
      drawer: const Menu(),
      body: ListView(children: [
        Text("Noticias")
      ]),
    );
  }
}