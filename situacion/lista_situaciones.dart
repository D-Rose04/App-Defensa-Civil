import '../../models/situaciones_model.dart';

import '../../models/entidad.dart';
import 'package:flutter/material.dart';

import 'package:defensa_civil/views/situacion/situaciones_detalles.dart';

class ListaSituaciones extends StatefulWidget {
  const ListaSituaciones({Key? key, required this.data}) : super(key: key);
  final Future<List<Entidad>> data;

  @override
  _ListaSituacionesState createState() => _ListaSituacionesState();

}

class _ListaSituacionesState extends State<ListaSituaciones> {
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
                      SituacionesModel situacionActual =
                          snapshot.data![index].getData();

                      return Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: ListTile(
                          key: Key("$index"),
                          leading: Text(situacionActual.codigo),
                          title: Text(situacionActual.titulo),
                          onTap: () {
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SituacionDetalles(situacionActual: situacionActual,)));
                          },
                        ),
                      );
                    }),
                  )
                // ignore: prefer_const_constructors
                : SliverToBoxAdapter(
                    child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: const Center(child: CircularProgressIndicator()),
                  ))
          ]);
        });
  }
}
