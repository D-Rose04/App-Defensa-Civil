import 'dart:convert';

import 'package:defensa_civil/models/entidad.dart';
import 'package:defensa_civil/models/parser.dart';
import 'package:defensa_civil/models/response_model.dart';

class MiembrosParser implements Parser {
  final String tipo;
  MiembrosParser({required this.tipo});

  @override
  List<Entidad> parse(String body) {
    final parsed = jsonDecode(body).cast<String, dynamic>();
    ResponseModel.tipo = tipo;
    return ResponseModel.fromJson(parsed).datos;
  }
}
