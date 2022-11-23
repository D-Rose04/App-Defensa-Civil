import 'package:defensa_civil/models/parser.dart';
import 'package:defensa_civil/utils/video_parser.dart';

class ParserManager {
  static Parser? getParser(String tipo) {
    Parser? parser;

    if (tipo == "videos") {
      parser = VideoParser();
    }

    return parser;
  }
}
