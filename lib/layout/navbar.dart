import 'package:defensa_civil/models/albergues_model.dart';
import 'package:defensa_civil/views/albergue/albergue_detalles.dart';
import 'package:defensa_civil/views/albergue/albergues.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/entidad.dart';

class NavBar extends StatelessWidget with PreferredSizeWidget {
  NavBar(
      {Key? key,
      required this.title,
      this.canSearch = false,
      this.bottom,
      this.data,
      this.tipo})
      : super(key: key);

  final String title;
  final bool canSearch;
  final PreferredSize? bottom;
  final Future<List<Entidad>>? data;
  final String? tipo;
  List<Entidad> suggestion = [];

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      data?.then((value) => value.forEach((e) {
            suggestion.add(e.getData());
          }));
    }
    return AppBar(
      title: Text(title),
      backgroundColor: Theme.of(context).primaryColor,
      bottom: bottom,
      actions: [
        canSearch
            ? IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: MySearchDelegate(tipo, suggestion));
                },
                icon: const Icon(Icons.search))
            : const Text("")
      ],
    );
  }

  @override
  Size get preferredSize =>
      bottom == null ? const Size.fromHeight(55) : const Size.fromHeight(100);
}

class MySearchDelegate extends SearchDelegate {
  MySearchDelegate(this.tipo, this.data);
  final String? tipo;
  final List<Entidad> data;
  Entidad? _selected;

  

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
          color: Theme.of(context).primaryColor,
          surfaceTintColor: Colors.white),
          textTheme: TextTheme(
            labelLarge: const TextStyle(color: Colors.black,fontWeight: FontWeight.normal),
            bodyLarge: TextStyle(color: Colors.blue.shade900),
            labelMedium: TextStyle(color: Colors.orange.shade900,fontWeight: FontWeight.bold),
            headlineSmall: TextStyle(color: Colors.blue.shade900,fontSize: 14,fontWeight: FontWeight.bold),
            titleSmall: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 12)
            
          )
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return AlbergueDetalles(
      albergueActual: _selected,
      searchResult: true,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Entidad> suggestions = data.where((element) {
      final result = element.getData();
      final input = query.toLowerCase();
      return result.edificio.toLowerCase().contains(input) || result.ciudad.toLowerCase().contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          AlberguesModel actual = suggestions[index].getData();
          return ListTile(
            leading: Icon(
              Icons.location_on_sharp,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            title: Text(actual.edificio,style: Theme.of(context).textTheme.headlineSmall,),
            subtitle: Text(actual.ciudad,style: Theme.of(context).textTheme.labelMedium),
            onTap: () {
              _selected = actual;
              query = actual.edificio;
              showResults(context);
            },
          );
        });
  }
}
