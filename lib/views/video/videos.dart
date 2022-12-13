import 'package:defensa_civil/models/entidad.dart';
import 'package:defensa_civil/utils/http_fetcher.dart';
import 'package:defensa_civil/views/video/video_display.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../layout/menu.dart';
import '../../layout/navbar.dart';
import '../../models/video_model.dart';

class Videos extends StatefulWidget {
  Videos({Key? key}) : super(key: key);
  final fetch = HttpFetcher(
      url: "https://adamix.net/defensa_civil/def/videos.php", tipo: "videos");

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
            backgroundColor: Colors.blue.shade900,
            appBar: NavBar(title: "Videos"),
            drawer: Menu(),
            body: CustomScrollView(slivers: [
              snapshot.hasData
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: snapshot.data!.length, (context, index) {
                        VideoModel videoActual =
                            snapshot.data![index].getData();
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                color: Colors.white,
                                child: ListTile(
                                  key: Key("$index"),
                                  iconColor: Colors.orange.shade900,
                                  trailing: const Icon(Icons.play_arrow),
                                  title: Text(
                                    videoActual.titulo,
                                    style: TextStyle(
                                        color: Colors.blue.shade900,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    videoActual.fecha,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => VideoDisplay(
                                                title: videoActual.titulo,
                                                url: videoActual.link)));
                                  },
                                ),
                              )),
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
