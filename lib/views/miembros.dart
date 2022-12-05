import 'package:defensa_civil/layout/navbar.dart';
import 'package:flutter/material.dart';

import '../layout/menu.dart';
import '../models/entidad.dart';
import '../utils/http_fetcher.dart';

class Miembros extends StatefulWidget {
  Miembros({Key? key}) : super(key: key);
  final fetch = HttpFetcher(
      url: "https://adamix.net/defensa_civil/def/miembros.php",
      tipo: "miembros");
  @override
  _MiembrosState createState() => _MiembrosState();
}

class _MiembrosState extends State<Miembros> {
  late Future<List<Entidad>> data;

  @override
  void initState() {
    super.initState();
    data = widget.fetch.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          return Scaffold(
            drawer: Menu(),
            appBar: NavBar(title: "Miembros"),
            body: Text("Aqui van los miembros"),
          );
        });
  }
}
