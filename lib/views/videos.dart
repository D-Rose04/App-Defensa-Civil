import 'package:defensa_civil/models/entidad.dart';
import 'package:defensa_civil/utils/http_fetcher.dart';
import 'package:defensa_civil/views/video_display.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../layout/menu.dart';
import '../layout/navbar.dart';
import '../models/video_model.dart';

class Videos extends StatefulWidget {
  Videos({Key? key}) : super(key: key);
  final fetch = HttpFetcher(
      url: "https://adamix.net/defensa_civil/def/videos.php", tipo: "videos");
  late Future<List<VideoModel>> videos;

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
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
            appBar: const NavBar(title: "Videos"),
            drawer: const Menu(),
            body: CustomScrollView(slivers: [
              snapshot.hasData
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: snapshot.data!.length, (context, index) {
                        VideoModel videoActual =
                            snapshot.data![index].getData();
                        return Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: ListTile(
                            key: Key("$index"),
                            leading: const Icon(Icons.video_collection),
                            title: Text(videoActual.titulo),
                            subtitle: Text(videoActual.fecha),
                            onTap: () {
                              Navigator.push(context, 
                              MaterialPageRoute(
                                builder: (context) => VideoDisplay(
                                  title: videoActual.titulo, url: videoActual.link) 
                                )
                              );
                            },
                          ),
                        );
                      }),
                    )
                  // ignore: prefer_const_constructors
                  : SliverToBoxAdapter(
                      child: const Center(
                      child: Center(child: CircularProgressIndicator()),
                    ))
            ]),
          );
        });
  }
}
