import 'package:defensa_civil/layout/navbar.dart';
import 'package:defensa_civil/models/miembros_model.dart';
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
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            drawer: Menu(),
            appBar: NavBar(title: "Miembros"),
            body: CustomScrollView(slivers: [
              snapshot.hasData
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: snapshot.data!.length, (context, index) {
                        MiembrosModel miembroactual =
                            snapshot.data![index].getData();
                        return Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Column(children: [
                                Container(
                                  child: CircleAvatar(
                                    radius: 116,
                                    backgroundColor: Colors.blue.shade400,
                                    child: CircleAvatar(
                                      radius: 113.5,
                                      backgroundImage:
                                          NetworkImage(miembroactual.foto),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(38),
                                  child: Column(children: [
                                    Text(miembroactual.cargo,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        miembroactual.nombre,
                                        style: TextStyle(
                                            color: Colors.orange.shade900,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ]),
                                )
                              ]),
                            ));
                      }),
                    )
                  // ignore: prefer_const_constructors
                  : SliverToBoxAdapter(
                      child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor)),
                    ))
            ]),
          );
        });
  }
}
