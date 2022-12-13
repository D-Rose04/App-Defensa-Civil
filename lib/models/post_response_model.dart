import 'package:defensa_civil/models/usuarios_model.dart';

class PostResponseModel {
  final bool exito;
  final UsuarioModel datos;
  final String mensaje;

  const PostResponseModel(
      {required this.exito,
      required this.datos,
      required this.mensaje,
});

  factory PostResponseModel.fromJson(Map<String, dynamic> json) {
    return PostResponseModel(
        exito: json["exito"],
        datos: UsuarioModel.fromJson(json["datos"]),
        mensaje: json["mensaje"]);
  }
}