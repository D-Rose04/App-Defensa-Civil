import 'package:defensa_civil/models/miembros_model.dart';
import 'package:defensa_civil/models/parser.dart';
import 'package:defensa_civil/utils/parser/albergue_parser.dart';
import 'package:defensa_civil/utils/parser/miembros_parser.dart';
import 'package:defensa_civil/utils/parser/noticia_parser.dart';
import 'package:defensa_civil/utils/parser/servicio_parser.dart';
import 'package:defensa_civil/utils/parser/video_parser.dart';

class ParserManager {
  static Parser? getParser(String tipo) {
    Parser? parser;

    if (tipo == "videos") {
      parser = VideoParser();
    }

    if (tipo == "albergues") {
      parser = AlbergueParser();
    }

    if (tipo == "noticias") {
      parser = NoticiaParser(tipo: tipo);
    }

    if (tipo == "miembros") {
      parser = MiembrosParser(tipo: tipo);
    }

    if(tipo == "servicios"){
      parser = ServicioParser();
    }

    return parser;
  }
}
