import 'package:defensa_civil/models/entidad.dart';

class MiembrosModel implements Entidad {
  final String id;
  final String foto;
  final String nombre;
  final String cargo;

  MiembrosModel(
      {required this.id,
      required this.foto,
      required this.nombre,
      required this.cargo});

  factory MiembrosModel.fromJson(Map<String, dynamic> json) {
    return MiembrosModel(
        id: json["id"],
        foto: json["foto"],
        nombre: json["nombre"],
        cargo: json["cargo"]);
  }
  @override
  getData() => MiembrosModel(id: id, foto: foto, nombre: nombre, cargo: cargo);
}
