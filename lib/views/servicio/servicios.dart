import 'package:defensa_civil/layout/menu.dart';
import 'package:defensa_civil/layout/navbar.dart';
import 'package:defensa_civil/models/servicios_model.dart';
import 'package:defensa_civil/views/servicio/lista_servicios.dart';
import 'package:flutter/material.dart';
import '../../../models/entidad.dart';
import '../../../utils/http_fetcher.dart';

class Servicios extends StatefulWidget {
  Servicios({Key? key}) : super(key: key);
  final fetch = HttpFetcher(
      url: "https://adamix.net/defensa_civil/def/servicios.php",
      tipo: "servicios");

  @override
  _ServiciosState createState() => _ServiciosState();
}

class _ServiciosState extends State<Servicios> with TickerProviderStateMixin {
  late Future<List<Entidad>> data;
  List<ServiciosModel> servicios = [];

  @override
  void initState() {
    data = widget.fetch.fetchData();
    data.then((value) => value.forEach((element) {
          servicios.add(element.getData());
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          return Scaffold(
              backgroundColor: Colors.blue.shade900,
              appBar: NavBar(title: "Servicios"),
              drawer: const Menu(),
              body: ListaServicios(data: data));
        });
  }
}
