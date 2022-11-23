import 'dart:convert';
import 'package:defensa_civil/models/parser.dart';
import 'package:defensa_civil/models/response_model.dart';
import '../../models/entidad.dart';

class VideoParser implements Parser {
  @override
  List<Entidad> parse(String body) {
    final parsed = jsonDecode(body).cast<String, dynamic>();
    ResponseModel.tipo = "videos";
    return ResponseModel.fromJson(parsed).datos;
  }
}
