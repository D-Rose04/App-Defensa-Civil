import 'dart:convert';

import '../../models/entidad.dart';
import '../../models/parser.dart';
import '../../models/response_model.dart';

class NoticiaParser implements Parser {
  final String tipo;
  NoticiaParser({required this.tipo});

  @override
  List<Entidad> parse(String body) {
    final parsed = jsonDecode(body).cast<String, dynamic>();
    ResponseModel.tipo = tipo;
    return ResponseModel.fromJson(parsed).datos;
  }
}
