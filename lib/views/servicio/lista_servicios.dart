import 'package:defensa_civil/views/servicio/servicio_detalles.dart';

import '../../models/entidad.dart';
import 'package:flutter/material.dart';
import '../../models/servicios_model.dart';

class ListaServicios extends StatefulWidget {
  const ListaServicios({Key? key, required this.data}) : super(key: key);
  final Future<List<Entidad>> data;

  @override
  _ListaServiciosState createState() => _ListaServiciosState();
}

class _ListaServiciosState extends State<ListaServicios> {
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
                      ServiciosModel servicioActual =
                          snapshot.data![index].getData();

                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Colors.white,
                            child: Container(
                              child: ListTile(
                                key: Key("$index"),
                                trailing: Text(
                                  servicioActual.id,
                                  style: TextStyle(
                                      color: Colors.orange.shade900,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                title: Text(
                                  servicioActual.nombre,
                                  style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ServicioDetalles(
                                                servicioActual: servicioActual,
                                              )));
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  )
                // ignore: prefer_const_constructors
                : SliverToBoxAdapter(
                    child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                        child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor)),
                  ))
          ]);
        });
  }
}
