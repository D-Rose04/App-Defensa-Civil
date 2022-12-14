import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Values {
  late String titulo;
  late String descripcion;
  late String latitud;
  late String longitud;

  ProValues(
      String titulo, String descripcion, String latitud, String longitud) {
    if (titulo != "") {
      this.titulo = titulo;
    } else if (descripcion != "") {
      this.descripcion = descripcion;
    } else if (latitud != "") {
      this.latitud = latitud;
    } else if (longitud != "") {
      this.longitud = longitud;
    }
  }
}
