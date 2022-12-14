import 'package:defensa_civil/models/entidad.dart';

class SituacionModel implements Entidad {
  final String id;
  final String voluntario;
  final String titulo;
  final String descripcion;
  final String foto;
  final String latitud;
  final String longitud;
  final String estado;
  final String fecha;

  SituacionModel(
      {required this.id,
      required this.voluntario,
      required this.titulo,
      required this.descripcion,
      required this.foto,
      required this.latitud,
      required this.longitud,
      required this.estado,
      required this.fecha});

  factory SituacionModel.fromJson(Map<String, dynamic> json) {
    return SituacionModel(
        id: json["id"],
        voluntario: json["voluntario"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        foto: json["foto"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        estado: json["estado"],
        fecha: json["fecha"]);
  }

  @override
  getData() => SituacionModel(
      id: id,
      voluntario: voluntario,
      titulo: titulo,
      descripcion: descripcion,
      foto: foto,
      latitud: latitud,
      longitud: longitud,
      estado: estado,
      fecha: fecha);
}
