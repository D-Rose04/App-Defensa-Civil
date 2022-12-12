import 'package:defensa_civil/layout/menu.dart';
import 'package:defensa_civil/layout/navbar.dart';
import 'package:defensa_civil/models/situaciones_model.dart';
import 'package:defensa_civil/views/situacion/lista_situaciones.dart';
import 'package:flutter/material.dart';
import '../../../models/entidad.dart';
import '../../../utils/http_fetcher.dart';

class Situaciones extends StatefulWidget {
  Situaciones({Key? key}) : super(key: key);
  final fetch = HttpFetcher(
      url: "https://adamix.net/defensa_civil/def/situaciones.php",
      tipo: "situaciones");

  @override
  _SituacionesState createState() => _SituacionesState();
}

class _SituacionesState extends State<Situaciones> with TickerProviderStateMixin {
  late Future<List<Entidad>> data;
  late List<Widget> _views = [
    const Center(
      child: Text("cargando"),
    ),
    const Center(child: Text("cargando"))
  ];
  List<SituacionesModel> situaciones = [];

  @override
  void initState() {
    data = widget.fetch.fetchData();
    data.then((value) => value.forEach((element) {
          situaciones.add(element.getData());
        }));
    super.initState();
    _views = [
      ListaSituaciones(data: data),
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
              appBar: NavBar(title: "Situaciones"),
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
