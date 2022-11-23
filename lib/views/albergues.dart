import 'package:defensa_civil/layout/menu.dart';
import 'package:defensa_civil/layout/navbar.dart';
import 'package:defensa_civil/models/response_model.dart';
import 'package:flutter/material.dart';

import '../models/albergues_model.dart';
import '../models/entidad.dart';
import '../models/response_model.dart';
import '../utils/http_fetcher.dart';

class Albergues extends StatefulWidget {
  Albergues({Key? key}) : super(key: key);
  final fetch = HttpFetcher(
      url: "https://adamix.net/defensa_civil/def/albergues.php", tipo: "albergues");
  
  
  @override
  _AlberguesState createState() => _AlberguesState();
}

class _AlberguesState extends State<Albergues> {
  late Future<List<Entidad>> data;
  
  @override
  void initState() {
    data = widget.fetch.fetchData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: const NavBar(title: "Albergues"),
            drawer: const Menu(),
            body: CustomScrollView(slivers: [
              snapshot.hasData
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: snapshot.data!.length, (context, index) {
                        AlberguesModel albergueActual =
                            snapshot.data![index].getData();
                        return Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: ListTile(
                            key: Key("$index"),
                            leading: Text(albergueActual.codigo),
                            title: Text(albergueActual.edificio),
                            subtitle: Text(albergueActual.ciudad)
                          ),
                        );
                      }),
                    )
                  // ignore: prefer_const_constructors
                  : SliverToBoxAdapter(
                      child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Center(child: CircularProgressIndicator()),
                    ))
            ]),
          );
        });
  }
}
