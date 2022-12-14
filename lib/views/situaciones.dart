import 'dart:convert';

import 'package:defensa_civil/models/entidad.dart';
import 'package:defensa_civil/models/situacion_model.dart';
import 'package:defensa_civil/utils/http_fetcher.dart';
import 'package:defensa_civil/views/video/video_display.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../layout/menu.dart';
import '../../layout/navbar.dart';
import '../../models/video_model.dart';
import 'package:http/http.dart' as http;

class Situaciones extends StatefulWidget {
  Situaciones({Key? key}) : super(key: key);

  @override
  _SituacionesState createState() => _SituacionesState();
}

class _SituacionesState extends State<Situaciones> {
  List data = [];
  handleData() async {
    var request = http.MultipartRequest('POST',
        Uri.parse('https://adamix.net/defensa_civil/def/situaciones.php'));

    request.fields.addAll({
      'token': Menu.user?.token,
    });

    http.StreamedResponse response = await request.send();
    http.Response body = await http.Response.fromStream(response);
    final parsed = jsonDecode(body.body) as Map<String, dynamic>;
    setState(() {
      data = List.from(parsed['datos'])
          .map<SituacionModel>((e) => SituacionModel.fromJson(e))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    handleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: NavBar(title: "Mis situaciones"),
        drawer: Menu(),
        body: CustomScrollView(
          slivers: [
            data.isEmpty
                ? SliverToBoxAdapter(
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        )),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                    childCount: data.length,
                    (context, index) {
                      SituacionModel situacionActual = data[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Colors.white,
                              child: ListTile(
                                key: Key("$index"),
                                trailing: Text(
                                  situacionActual.estado,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                title: Text(
                                  situacionActual.titulo,
                                  style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  situacionActual.descripcion,
                                  style: TextStyle(
                                      color: Colors.orange.shade900,
                                      fontSize: 10),
                                ),
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => AlbergueDetalles(
                                  //               albergueActual: albergueActual,
                                  //             )));
                                },
                              ),
                            )),
                      );
                    },
                  ))
          ],
        ));
  }
}
