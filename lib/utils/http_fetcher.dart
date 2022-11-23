import 'package:defensa_civil/models/entidad.dart';
import 'package:defensa_civil/models/parser.dart';
import 'package:defensa_civil/utils/parse_manager.dart';
import 'package:http/http.dart' as http;


class HttpFetcher {
  HttpFetcher({required this.url,required this.tipo});
  final String url;
  final String tipo;
  late Parser parser;

  Future<List<Entidad>> fetchData() async {
    final response = await http.Client().get(Uri.parse(url));
    parser = ParserManager.getParser(tipo)!;
    return parser.parse(response.body);
  }
}
