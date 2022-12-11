import 'package:defensa_civil/models/entidad.dart';

class MedidasPreventivasModel implements Entidad {
  final String id;
  final String titulo;
  final String descripcion;
  final String foto;
  final String https;

  MedidasPreventivasModel(
      {required this.id,
      required this.titulo,
      required this.descripcion,
      required this.foto,
      required this.https});

  factory MedidasPreventivasModel.fromJson(Map<String, dynamic> json) {
    return MedidasPreventivasModel(
        id: json["id"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        foto: json["foto"],
        https: json["https"]);
  }

  @override
  getData() => MedidasPreventivasModel(
      id: id,
      titulo: titulo,
      descripcion: descripcion,
      foto: foto,
      https: https);
}
