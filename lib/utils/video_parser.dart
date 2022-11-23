import 'dart:convert';
import 'package:defensa_civil/models/parser.dart';
import 'package:defensa_civil/models/video_model_response.dart';
import '../models/entidad.dart';

class VideoParser implements Parser {
  @override
  List<Entidad> parse(String body) {
    final parsed = jsonDecode(body).cast<String, dynamic>();
    return VideoModelResponse.fromJson(parsed).datos;
  }
}
