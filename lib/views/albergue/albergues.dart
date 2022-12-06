import 'package:defensa_civil/layout/menu.dart';
import 'package:defensa_civil/layout/navbar.dart';
import 'package:defensa_civil/models/albergues_model.dart';
import 'package:defensa_civil/views/albergue/lista_albergues.dart';
import 'package:defensa_civil/views/mapa.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
  late TabController _tabController;
  late List<Widget> _views = [
    const Center(
      child: Text("cargando"),
    ),
    const Center(child: Text("cargando"))
  ];
  List<AlberguesModel> albergues = [];
  int _selectedIndex = 0;
  @override
  void initState() {
    data = widget.fetch.fetchData();
    data.then((value) => value.forEach((element) {
          albergues.add(element.getData());
        }));
    _tabController = TabController(length: 6, vsync: this);
    _tabController.animateTo(2);

    super.initState();
    _views = [
      ListaAlbergues(data: data),
      albergues.isEmpty ? Mapa(coords: albergues) : const Text("a"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width / 6) - 4;

    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: NavBar(
                  canSearch: true,
                  data: data,
                  tipo: "albergues",
                  title: "Albergues",bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(50),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 8),
                        child: GNav(
                          activeColor: Colors.white,
                          gap: 5,
                          iconSize: 30,
                          padding: EdgeInsets.symmetric(
                              horizontal: width, 
                              vertical: 5
                          ),
                          duration: const Duration(milliseconds: 400),
                          tabBackgroundColor:
                              Theme.of(context).secondaryHeaderColor,
                          color: Colors.white,
                          // ignore: prefer_const_literals_to_create_immutables
                          tabs: [
                            const GButton(
                              icon: Icons.list_alt_outlined,
                              text: 'Listado',
                            ),
                            const GButton(
                              icon: Icons.map_outlined,
                              text: 'Mapa',
                            ),
                          ],
                          selectedIndex: _selectedIndex,
                          onTabChange: (index) {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                        ),
                      )),),
                drawer: const Menu(),
                body: _views.elementAt(_selectedIndex),
              ));
        });
  }
}
