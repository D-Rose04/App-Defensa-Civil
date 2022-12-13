import 'entidad.dart';

class UsuarioModel implements Entidad {
  final String id;
  final String nombre;
  final String apellido;
  final String correo;
  final String telefono;
  
  var token;

  UsuarioModel(
      {required this.id,
      required this.nombre,
      required this.apellido,
      required this.correo,
      required this.telefono,
      required this.token
      });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
        telefono: json["telefono"],
        token: json["token"]);
  }

  @override
  getData() => UsuarioModel(
    id: id, 
    nombre: nombre,
    apellido: apellido,
    correo: correo,
    telefono: telefono,
    token: token);
}
