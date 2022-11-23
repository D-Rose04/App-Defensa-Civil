import 'package:defensa_civil/models/entidad.dart';

class VideoModel implements Entidad {
  final String id;
  final String fecha;
  final String titulo;
  final String? descripcion;
  final String link;

  VideoModel(
      {required this.id,
      required this.fecha,
      required this.titulo,
      required this.descripcion,
      required this.link});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json["id"],
      fecha: json["fecha"],
      titulo: json["titulo"],
      descripcion: json['descripcion'],
      link: json['link'],
    );
  }
  
  @override
  getData() {
    return VideoModel(id: id, fecha: fecha, titulo: titulo, descripcion: descripcion, link: link);
  }
}
