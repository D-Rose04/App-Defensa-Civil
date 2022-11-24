import 'package:defensa_civil/layout/menu.dart';
import 'package:defensa_civil/layout/navbar.dart';
import 'package:defensa_civil/models/albergues_model.dart';
import 'package:defensa_civil/views/albergue/lista_albergues.dart';
import 'package:defensa_civil/views/mapa.dart';
import 'package:flutter/material.dart';
import '../../models/entidad.dart';
import '../../utils/http_fetcher.dart';

class Albergues extends StatefulWidget {
  Albergues({Key? key}) : super(key: key);
  final fetch = HttpFetcher(
      url: "https://adamix.net/defensa_civil/def/albergues.php",
      tipo: "albergues");

  @override
  _AlberguesState createState() => _AlberguesState();
}

class _AlberguesState extends State<Albergues> with TickerProviderStateMixin {
  late Future<List<Entidad>> data;
  late TabBar myTabBar;
  late TabController _tabController;
  late List<Widget> _views = [
    const Center(
      child: Text("cargando"),
    ),
    const Center(child: Text("cargando"))
  ];
  List<AlberguesModel> albergues = [];

  @override
  void initState() {
    data = widget.fetch.fetchData();
    data.then((value) => value.forEach((element) {albergues.add(element.getData());}) );
    _tabController = TabController(length: 6, vsync: this);
    _tabController.animateTo(2);

    myTabBar = const TabBar(
        // ignore: prefer_const_literals_to_create_immutables
        tabs: [
          Tab(
              icon: Icon(Icons.list_alt_rounded),
              text: "Listado",
              iconMargin: EdgeInsets.all(1)),
          Tab(
              icon: Icon(Icons.map_outlined),
              text: "Mapa",
              iconMargin: EdgeInsets.all(1)),
        ]);
    super.initState();
    _views = [
      ListaAlbergues(data: data),
      albergues.isEmpty? Mapa(coords: albergues):const Text("a"),
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
                appBar: const NavBar(title: "Albergues"),
                drawer: const Menu(),
                body: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: _views,
                ),
                bottomNavigationBar: Container(
                    color: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.all(1),
                    child: myTabBar)),
          );
        });
  }
}
