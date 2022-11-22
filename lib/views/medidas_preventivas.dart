import 'package:flutter/material.dart';
import '../layout/menu.dart';
import '../layout/navBar.dart';

class MedidasPreventivas extends StatefulWidget {
  const MedidasPreventivas({ Key? key }) : super(key: key);

  @override
  _MedidasPreventivasState createState() => _MedidasPreventivasState();
}

class _MedidasPreventivasState extends State<MedidasPreventivas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(title: "Medidas Preventivas",),
      drawer: const Menu(),
      body: ListView(children: [
        Text("Medidas preventivas")
      ]),
    );
  }
}