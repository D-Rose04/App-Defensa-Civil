import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ingrese {
  late String labeltext;

  Ingrese(String labeltext) {
    this.labeltext = labeltext;
  }

  Container GenerarField() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 200,
      height: 50,
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 230, 81, 0),
          ),
          border: OutlineInputBorder(),
          labelText: "",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
            borderSide: BorderSide(
              width: 2,
              color: Color.fromARGB(255, 230, 81, 0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
            borderSide: BorderSide(
              width: 3.3,
              color: Color.fromARGB(255, 230, 81, 0),
            ),
          ),
        ),
      ),
    );
  }
}
