import 'package:flutter/material.dart';

import '../layout/menu.dart';
import '../layout/navbar.dart';

class Videos extends StatefulWidget {
  const Videos({ Key? key }) : super(key: key);

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(title: "Videos",),
      drawer: const Menu(),
      body: ListView(children: [
        Text("videos")
      ]),
    );
  }
}