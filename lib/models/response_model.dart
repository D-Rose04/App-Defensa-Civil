import 'package:defensa_civil/models/albergues_model.dart';
import 'package:defensa_civil/models/entidad.dart';
import 'package:defensa_civil/models/medidas_preventivas_models.dart';
import 'package:defensa_civil/models/miembros_model.dart';
import 'package:defensa_civil/models/noticias_model.dart';
import 'package:defensa_civil/models/servicios_model.dart';
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

          if (tipo == "albergues") {
            return AlberguesModel.fromJson(d);
          }

          if (tipo == "noticias") {
            return NoticiasModel.fromJson(d);
          }

          if (tipo == "miembros") {
            return MiembrosModel.fromJson(d);
          }

          if (tipo == "servicios") {
            return ServiciosModel.fromJson(d);
          }

          if (tipo == "medidaspreventivas") {
            return MedidasPreventivasModel.fromJson(d);
          }
        })),
        mensaje: json["mensaje"]);
  }
}
