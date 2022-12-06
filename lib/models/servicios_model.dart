import 'package:defensa_civil/models/entidad.dart';

class ServiciosModel implements Entidad {
  final String id;
  final String nombre;
  final String descripcion;
  final String foto;

  ServiciosModel(
      {required this.id,
      required this.nombre,
      required this.descripcion,
      required this.foto});

  factory ServiciosModel.fromJson(Map<String, dynamic> json) {
    return ServiciosModel(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        foto: json["foto"]);
  }

  @override
  getData() => ServiciosModel(
      id: id, 
      nombre: nombre, 
      descripcion: descripcion, 
      foto: foto);
}
