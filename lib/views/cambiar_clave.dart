import 'dart:convert';

import 'package:defensa_civil/layout/navbar.dart';
import 'package:defensa_civil/models/usuarios_post_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../layout/menu.dart';
import 'package:http/http.dart' as http;

class CambiarClave extends StatefulWidget {
  const CambiarClave({Key? key}) : super(key: key);

  @override
  _CambiarClaveState createState() => _CambiarClaveState();
}

class _CambiarClaveState extends State<CambiarClave> {
  final _formKey = GlobalKey<FormState>();
  final inputControllerClaveAnterior = TextEditingController();
  final inputControllerClaveNueva = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<String> placeholder = [
      "Ingrese su anterior contraseña",
      "Ingrese su nueva contraseña",
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
        appBar: NavBar(title: 'Cambio de contraseña'),
        drawer: Menu(),
        backgroundColor: Colors.blue.shade900,
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(5),
                                child: Text("Cambiar Contraseña",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall)),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: TextFormField(
                                controller: inputControllerClaveAnterior,
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
                                controller: inputControllerClaveNueva,
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
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    minimumSize: Size(340, 50), //////// HERE
                                  ),
                                  onPressed: () async {
                                    //validate all the form fields
                                    if (_formKey.currentState!.validate()) {
                                      // instantiate a new post request
                                      var request = http.MultipartRequest(
                                          'POST',
                                          Uri.parse(
                                              'https://adamix.net/defensa_civil/def/cambiar_clave.php'));
                                      // adds all the field in form data format
                                      request.fields.addAll({
                                        'token': Menu.user?.token,
                                        'clave_anterior':
                                            inputControllerClaveAnterior.text,
                                        'clave_nueva':
                                            inputControllerClaveNueva.text,
                                      });

                                      // response result
                                      http.StreamedResponse response =
                                          await request.send();
                                      http.Response body =
                                          await http.Response.fromStream(
                                              response);
                                      final parsed = jsonDecode(body.body)
                                          as Map<String, dynamic>;

                                      if (response.statusCode == 200) {
                                        GoRouter.of(context).go('/inicio');
                                      }
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor:
                                                  Colors.orange.shade900,
                                              content:
                                                  Text(parsed["mensaje"])));
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
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
