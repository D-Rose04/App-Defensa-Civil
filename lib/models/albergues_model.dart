import 'package:defensa_civil/models/entidad.dart';

class AlberguesModel implements Entidad {
  final String ciudad;
  final String codigo;
  final String edificio;
  final String coordinador;
  final String telefono;
  final String? capacidad;
  final String lat;
  final String lng;

  AlberguesModel(
      {required this.ciudad,
      required this.codigo,
      required this.edificio,
      required this.coordinador,
      required this.telefono,
      required this.capacidad,
      required this.lat,
      required this.lng});

  factory AlberguesModel.fromJson(Map<String, dynamic> json) {
    return AlberguesModel(
        ciudad: json["ciudad"],
        codigo: json["codigo"],
        edificio: json["edificio"],
        coordinador: json["coordinador"],
        telefono: json["telefono"],
        capacidad: json["capacidad"],
        lat: json["lat"],
        lng: json["lng"]);
  }

  @override
  getData() => AlberguesModel(
      ciudad: ciudad,
      codigo: codigo,
      edificio: edificio,
      coordinador: coordinador,
      telefono: telefono,
      capacidad: capacidad,
      lat: lat,
      lng: lng);
}
