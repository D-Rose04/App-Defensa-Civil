import 'dart:convert';

import 'package:defensa_civil/models/response_model.dart';
import 'package:flutter/material.dart';
import '../layout/menu.dart';
import '../layout/navbar.dart';
import 'package:http/http.dart' as http;

class Voluntario extends StatefulWidget {
  const Voluntario({Key? key}) : super(key: key);

  @override
  _VoluntarioState createState() => _VoluntarioState();
}

class _VoluntarioState extends State<Voluntario> {
  final _formKey = GlobalKey<FormState>();
  final inputControllerCedula = TextEditingController();
  final inputControllerNombre = TextEditingController();
  final inputControllerApellido = TextEditingController();
  final inputControllerClave = TextEditingController();
  final inputControllerCorreo = TextEditingController();
  final inputControllerTelefono = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<String> placeholder = [
      "Ingrese su cedula",
      "Ingrese su nombre",
      "Ingrese su apellido",
      "Ingrese su contraseña",
      "Ingrese su correo",
      "Ingrese su telefono",
    ];

    myInputDecoration(number) => InputDecoration(
        hintText: placeholder[number],
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 2.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ));

    return Scaffold(
      appBar: NavBar(
        title: "Voluntariado",
      ),
      drawer: Menu(),
      backgroundColor: Colors.blue.shade900,
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      child: Text("Registro de voluntarios",
                          style: Theme.of(context).textTheme.displaySmall)),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      controller: inputControllerCedula,
                      decoration: myInputDecoration(0),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Este campo debe ser completado';
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      controller: inputControllerNombre,
                      decoration: myInputDecoration(1),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Este campo debe ser completado';
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      controller: inputControllerApellido,
                      decoration: myInputDecoration(2),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Este campo debe ser completado';
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      obscureText: true,
                      controller: inputControllerClave,
                      decoration: myInputDecoration(3),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Este campo debe ser completado';
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      controller: inputControllerCorreo,
                      decoration: myInputDecoration(4),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Este campo debe ser completado';
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      controller: inputControllerTelefono,
                      decoration: myInputDecoration(5),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Este campo debe ser completado';
                        }
                      },
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.shade900,
                          foregroundColor: Colors.white,
                          shadowColor: Colors.white,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: Size(250, 50), //////// HERE
                        ),
                        onPressed: () async {
                          //validate all the form fields
                          if (_formKey.currentState!.validate()) {
                            // instantiate a new post request
                            var request = http.MultipartRequest(
                                'POST',
                                Uri.parse(
                                    'https://adamix.net/defensa_civil/def/registro.php'));
                            // adds all the field in form data format
                            request.fields.addAll({
                              'cedula': inputControllerCedula.text,
                              'nombre': inputControllerNombre.text,
                              'apellido': inputControllerApellido.text,
                              'clave': inputControllerClave.text,
                              'correo': inputControllerCorreo.text,
                              'telefono': inputControllerTelefono.text,
                            });

                            // response result
                            http.StreamedResponse response =
                                await request.send();
                            http.Response body =
                                await http.Response.fromStream(response);
                            final parsed =
                                jsonDecode(body.body) as Map<String, dynamic>;

                            if (response.statusCode == 200) {
                              
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("${response.reasonPhrase}")));
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: Colors.orange.shade900,
                                      content: Text(parsed["mensaje"])));
                          }
                        },
                        child: const Text("Enviar"),
                      ))
                ],
              )),
        ),
      ]),
    );
  }
}
