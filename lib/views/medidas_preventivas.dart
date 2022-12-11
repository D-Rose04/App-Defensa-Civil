import 'package:defensa_civil/layout/navbar.dart';
import 'package:flutter/material.dart';
import '../layout/menu.dart';
import '../models/entidad.dart';
import '../models/medidas_preventivas_models.dart';
import '../utils/http_fetcher.dart';

class MedidasPreventivas extends StatefulWidget {
  MedidasPreventivas({Key? key}) : super(key: key);
  final Fetch = HttpFetcher(
      url: "https://adamix.net/defensa_civil/def/medidas_preventivas.php",
      tipo: "medidaspreventivas");
  @override
  _MedidasPreventivasState createState() => _MedidasPreventivasState();
}

class _MedidasPreventivasState extends State<MedidasPreventivas> {
  late Future<List<Entidad>> data;

  @override
  void initState() {
    super.initState();
    data = widget.Fetch.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          return Scaffold(
            drawer: Menu(),
            appBar: NavBar(title: "Medidas preventivas"),
            body: CustomScrollView(slivers: [
              snapshot.hasData
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: snapshot.data!.length, (context, index) {
                        MedidasPreventivasModel medidaactual =
                            snapshot.data![index].getData();
                        return Container();
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
