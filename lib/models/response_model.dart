import 'package:defensa_civil/models/albergues_model.dart';
import 'package:defensa_civil/models/entidad.dart';
import 'package:defensa_civil/models/video_model.dart';

class ResponseModel {
  final bool exito;
  final List<Entidad> datos;
  final String mensaje;
  static String? tipo;

  ResponseModel(
      {required this.exito, required this.datos, required this.mensaje});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
        exito: json["exito"],
        datos: List<Entidad>.from(json["datos"].map((d) {
          if (tipo == "videos") {
            return VideoModel.fromJson(d);
          }

          if(tipo == "albergues"){
            return AlberguesModel.fromJson(d);
          }
        })),
        mensaje: json["mensaje"]);
  }
}
