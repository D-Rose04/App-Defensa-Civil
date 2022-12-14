import 'package:defensa_civil/models/entidad.dart';
import 'package:defensa_civil/models/situacion_model.dart';
import 'package:defensa_civil/models/usuarios_model.dart';

class SituacionesPostResponseModel {
  final bool exito;
  final List<SituacionModel> datos;
  final String mensaje;

  const SituacionesPostResponseModel({
    required this.exito,
    required this.datos,
    required this.mensaje,
  });

  factory SituacionesPostResponseModel.fromJson(Map<String, dynamic> json) {
    return SituacionesPostResponseModel(
        exito: json["exito"],
        datos: List<SituacionModel>.from(json["datos"]).toList(),
        mensaje: json["mensaje"]);
  }
}
