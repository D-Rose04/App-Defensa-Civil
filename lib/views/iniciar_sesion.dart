import 'dart:convert';

import 'package:defensa_civil/models/post_response_model.dart';
import 'package:defensa_civil/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../layout/menu.dart';
import '../layout/navbar.dart';
import 'package:http/http.dart' as http;

class InicioSesion extends StatefulWidget {
  const InicioSesion({Key? key}) : super(key: key);

  @override
  _InicioSesionState createState() => _InicioSesionState();
}

class _InicioSesionState extends State<InicioSesion> {
  final _formKey = GlobalKey<FormState>();
  final inputControllerCedula = TextEditingController();
  final inputControllerClave = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<String> placeholder = [
      "Ingrese su cedula",
      "Ingrese su contraseña",
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
        backgroundColor: Colors.blue.shade900,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(2.0),
                          child: Image.asset(
                            "images/logo.png",
                            width: 180,
                            height: 180,
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Inicio de sesión",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            )),
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
                            obscureText: true,
                            controller: inputControllerClave,
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
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber.shade900,
                                foregroundColor: Colors.white,
                                shadowColor: Colors.white,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0)),
                                minimumSize: Size(340, 50), //////// HERE
                              ),
                              onPressed: () async {
                                //validate all the form fields
                                if (_formKey.currentState!.validate()) {
                                  // instantiate a new post request
                                  var request = http.MultipartRequest(
                                      'POST',
                                      Uri.parse(
                                          'https://adamix.net/defensa_civil/def/iniciar_sesion.php'));
                                  // adds all the field in form data format
                                  request.fields.addAll({
                                    'cedula': inputControllerCedula.text,
                                    'clave': inputControllerClave.text,
                                  });

                                  // response result
                                  http.StreamedResponse response =
                                      await request.send();

                                  if (response.statusCode == 200) {
                                    http.Response body =
                                        await http.Response.fromStream(
                                            response);
                                    final parsed = jsonDecode(body.body)
                                        as Map<String, dynamic>;
                                    PostResponseModel res =
                                        PostResponseModel.fromJson(parsed);

                                    Menu.user = res.datos;
                                    Menu.logged = res.exito;

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor:
                                                Colors.orange.shade900,
                                            content: Text(
                                                "Bienvenido/a ${Menu.user?.nombre} ${Menu.user?.apellido}")));
                                    GoRouter.of(context).go('/inicio');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "${response.reasonPhrase}")));
                                  }
                                }
                              },
                              child: const Text(
                                "Iniciar sesión",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "O",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              minimumSize: Size(340, 50),
                            ),
                            onPressed: () {
                              GoRouter.of(context).go('/inicio');
                            },
                            child: Text(
                              "Continua como invitado",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
