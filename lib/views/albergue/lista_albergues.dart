import 'package:defensa_civil/layout/navbar.dart';
import 'package:defensa_civil/views/albergue/albergue_detalles.dart';
import 'package:flutter/material.dart';

import '../../models/albergues_model.dart';
import '../../models/entidad.dart';

class ListaAlbergues extends StatefulWidget {
  const ListaAlbergues({Key? key, required this.data}) : super(key: key);
  final Future<List<Entidad>> data;

  @override
  _ListaAlberguesState createState() => _ListaAlberguesState();
}

class _ListaAlberguesState extends State<ListaAlbergues> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.data,
        builder: (context, snapshot) {
          return CustomScrollView(slivers: [
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
                          subtitle: Text(albergueActual.ciudad),
                          onTap: () {
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AlbergueDetalles(albergueActual: albergueActual,)));
                          },
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
          ]);
        });
  }
}
