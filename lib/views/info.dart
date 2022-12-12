import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

import '../layout/menu.dart';
import '../layout/navbar.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const NavBar(
          title: "Acerca de",
        ),
        drawer: const Menu(),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Participantes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: 350,
                  height: 250,
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('images/rafa2.jpeg'),
                ),
                const Text(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    'Rafael Cid\nrafaelcid40@gmail.com'),
                Linkify(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  onOpen: _onOpen,
                  text: 'Telefono https://twitter.com\nTel:+18098558689',
                ),
                Container(
                  width: 350,
                  height: 250,
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('images/placeholder.png'),
                ),
                const Text(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    'David Benjamín Hernández De La Rosa\nCORREO '),
                Linkify(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  onOpen: _onOpen,
                  text: 'Telegram https://twitter.com\nTel',
                ),
                Container(
                  width: 350,
                  height: 250,
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('images/placeholder.png'),
                ),
                const Text(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    'Johan Carlos Ventura Herrera\nCORREO '),
                Linkify(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  onOpen: _onOpen,
                  text: 'Telegram https://twitter.com\nTel',
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                ),
              ]),
        )));
  }

  Future<void> _onOpen(LinkableElement link) async {
    // ignore: deprecated_member_use
    if (await canLaunch(link.url)) {
      // ignore: deprecated_member_use
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }
}
