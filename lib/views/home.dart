import 'package:defensa_civil/layout/menu.dart';
import 'package:defensa_civil/layout/navbar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const NavBar(title: "Home",),
        drawer: const Menu(),
        body: ListView(
          children: [
            Text("Inicio")
          ],
        ),
      );
}
