import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
const Menu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Drawer(
      // ignore: prefer_const_literals_to_create_immutables
      child: ListView(children: [
        const ListTile(leading: Icon(Icons.home),title: Text("Home"))
        
      ]),
    );
  }
}