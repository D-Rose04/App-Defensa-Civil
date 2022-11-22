import 'package:defensa_civil/layout/menu.dart';
import 'package:defensa_civil/layout/navbar.dart';
import 'package:flutter/material.dart';

class Historia extends StatelessWidget {
const Historia({ Key? key }) : super(key: key);

  @override
  // ignore: prefer_const_constructors
  Widget build(BuildContext context) => Scaffold(
    appBar: const NavBar(title: "Historia",),
    drawer: const Menu(),
    body: ListView(children: [
      Text("Historia")
    ]),
  );
  

}