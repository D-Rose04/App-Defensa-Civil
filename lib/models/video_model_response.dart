import 'package:defensa_civil/models/video_model.dart';

class VideoModelResponse{
  final bool exito;
  final List<VideoModel> datos;
  final String mensaje;

  VideoModelResponse({
    required this.exito,
    required this.datos,
    required this.mensaje
  });

  factory VideoModelResponse.fromJson(Map<String, dynamic> json) {
    return VideoModelResponse(
      exito: json["exito"],
      datos: List<VideoModel>.from(json["datos"].map((d) => VideoModel.fromJson(d))),
      mensaje: json["mensaje"] 
    );
  }

}