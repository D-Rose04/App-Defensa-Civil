import 'package:defensa_civil/models/usuarios_model.dart';

class UsuarioPostResponseModel {
  final bool exito;
  final UsuarioModel datos;
  final String mensaje;

  const UsuarioPostResponseModel(
      {required this.exito,
      required this.datos,
      required this.mensaje,
});

  factory UsuarioPostResponseModel.fromJson(Map<String, dynamic> json) {
    return UsuarioPostResponseModel(
        exito: json["exito"],
        datos: UsuarioModel.fromJson(json["datos"]),
        mensaje: json["mensaje"]);
  }
}