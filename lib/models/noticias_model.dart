import 'entidad.dart';

class NoticiasModel implements Entidad {
  final String id;
  final String fecha;
  final String titulo;
  final String contenido;
  final String foto;

  NoticiasModel(
      {required this.id,
      required this.fecha,
      required this.titulo,
      required this.contenido,
      required this.foto});

  factory NoticiasModel.fromJson(Map<String, dynamic> json) {
    return NoticiasModel(
        id: json["id"],
        fecha: json["fecha"],
        titulo: json["titulo"],
        contenido: json["contenido"],
        foto: json["foto"]);
  }

  @override
  getData() => NoticiasModel(
    id: id, 
    fecha: fecha,
    titulo: titulo,
    contenido: contenido,
    foto: foto);
}
