import 'package:defensa_civil/models/noticias_model.dart';
import 'package:defensa_civil/views/noticias_detalle.dart';
import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';

import '../layout/menu.dart';
import '../layout/navbar.dart';
import '../models/entidad.dart';
import '../utils/http_fetcher.dart';

class Noticias extends StatefulWidget {
  Noticias({Key? key}) : super(key: key);
  final fetch = HttpFetcher(
      url: "https://adamix.net/defensa_civil/def/noticias.php",
      tipo: "noticias");
  @override
  _NoticiasState createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
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
            drawer: Menu(),
            appBar: NavBar(title: "Noticias"),
            body: CustomScrollView(slivers: [
              snapshot.hasData
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: snapshot.data!.length, (context, index) {
                      NoticiasModel noticiaActual =
                          snapshot.data![index].getData();

                      return Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 10,
                        child: InkWell(
                          splashColor: Theme.of(context).primaryColor,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NoticiasDetalle(
                                        noticia: noticiaActual)));
                          },
                          child: Container(
                              padding:
                                  const EdgeInsets.only(bottom: 20, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    padding: const EdgeInsets.only(
                                        right: 5, bottom: 15, top: 20, left: 5),
                                    child: Text(
                                      noticiaActual.titulo,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: ProgressiveImage(
                                        placeholder: const AssetImage(
                                            "images/placeholder.png"),
                                        thumbnail:
                                            NetworkImage(noticiaActual.foto),
                                        image: NetworkImage(noticiaActual.foto),
                                        height: 250,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.only(
                                        top: 20, left: 10, right: 10),
                                    height: 110,
                                    child: Text(
                                      noticiaActual.contenido,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 6,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        noticiaActual.fecha,
                                        style: const TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                      ))
                                ],
                              )),
                        ),
                      );
                    }))
                  : SliverToBoxAdapter(
                      child: Container(
                      height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.all(5),
                      child: const Center(child: CircularProgressIndicator()),
                    ))
            ]),
          );
        });
  }
}
