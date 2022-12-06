import 'package:flutter/material.dart';

import '../layout/menu.dart';
import '../layout/navbar.dart';

class Info extends StatelessWidget {
const Info({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: NavBar(title: "Acerca de",),
      drawer: const Menu(),
      body: ListView(children: [
        Text("Info")
      ]),
    );
  }
}