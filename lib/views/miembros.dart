import 'package:flutter/material.dart';

import '../layout/menu.dart';
import '../layout/navBar.dart';

class Miembros extends StatelessWidget {
const Miembros({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: const NavBar(title: "Miembros",),
      drawer: const Menu(),
      body: ListView(children: [
        Text("Miembros")
      ]),
    );
  }
}