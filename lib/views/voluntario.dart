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
  final inputControllerEmail = TextEditingController();
  final inputControllerTelefono = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        title: "Voluntariado",
      ),
      drawer: const Menu(),
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
                      decoration:
                          const InputDecoration(hintText: "Ingrese su cedula"),
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
                      decoration:
                          const InputDecoration(hintText: "Ingrese su nombre"),
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
                      decoration: const InputDecoration(
                          hintText: "Ingrese su apellido"),
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
                      controller: inputControllerClave,
                      decoration: const InputDecoration(
                          hintText: "Ingrese su contraseña"),
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
                      controller: inputControllerEmail,
                      decoration:
                          const InputDecoration(hintText: "Ingrese su email"),
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
                      decoration: const InputDecoration(
                          hintText: "Ingrese su telefono"),
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var request = http.MultipartRequest(
                                'POST',
                                Uri.parse(
                                    'https://adamix.net/defensa_civil/def/registro.php'));

                            request.fields.addAll({
                              'cedula': "",
                              'nombre': "",
                              'apellido': "",
                              'clave': "",
                              'correo': "",
                              'telefono': ""
                            });

                            http.StreamedResponse response =
                                await request.send();

                            if (response.statusCode == 200) {
                              request.fields.forEach((key, value) => print(value),);
                              print(await response.stream.bytesToString());
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ok")));
                            } else {
                              print(response.reasonPhrase);
                            }
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
