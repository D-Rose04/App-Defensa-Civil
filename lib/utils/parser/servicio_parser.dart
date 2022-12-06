import 'dart:convert';

import '../../models/entidad.dart';
import '../../models/parser.dart';
import '../../models/response_model.dart';

class ServicioParser implements Parser{
  // final String tipo;
  // ServicioParser({required this.tipo});

  @override
  List<Entidad> parse(String body){
    final parsed = jsonDecode(body).cast<String, dynamic>();
    ResponseModel.tipo = "servicios";
    return ResponseModel.fromJson(parsed).datos;
  }
}