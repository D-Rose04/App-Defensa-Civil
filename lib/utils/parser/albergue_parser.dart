import 'dart:convert';

import '../../models/entidad.dart';
import '../../models/parser.dart';
import '../../models/response_model.dart';

class AlbergueParser implements Parser {
  @override
  List<Entidad> parse(String body) {
    final parsed = jsonDecode(body).cast<String, dynamic>();
    ResponseModel.tipo = "albergues";
    return ResponseModel.fromJson(parsed).datos;
  }
}
