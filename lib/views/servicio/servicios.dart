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
  // late TabBar myTabBar;
  // late TabController _tabController;
  late List<Widget> _views = [
    const Center(
      child: Text("cargando"),
    ),
    const Center(child: Text("cargando"))
  ];
  List<ServiciosModel> servicios = [];

  @override
  void initState() {
    data = widget.fetch.fetchData();
    data.then((value) => value.forEach((element) {
          servicios.add(element.getData());
        }));
    super.initState();
    _views = [
      ListaServicios(data: data),
      const Text("a"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: const NavBar(title: "Servicios"),
              drawer: const Menu(),
              body: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: _views,
              ),
            ),
          );
        });
  }
}
