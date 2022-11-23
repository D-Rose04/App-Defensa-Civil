import 'entidad.dart';

abstract class Parser {
  List<Entidad> parse(String body); 
}
