import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../layout/menu.dart';
import '../layout/navbar.dart';

class Reporta extends StatefulWidget {
  const Reporta({Key? key}) : super(key: key);

  @override
  _ReportaState createState() => _ReportaState();
}

class _ReportaState extends State<Reporta> {
  final _formKey = GlobalKey<FormState>();
  final valueCtlr = TextEditingController();
  final valueCtlr2 = TextEditingController();
  final valueCtlr3 = TextEditingController();
  final valueCtlr4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final List<String> placeholder = [
      "Ingrese el título",
      "Ingrese la dirección",
      "Ingrese la latitud",
      "Ingrese la longitud"
    ];

    myInputDecoration(number) => InputDecoration(
          hintText: placeholder[number],
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
            borderSide: BorderSide(
              width: 2.9,
              color: Color.fromARGB(255, 230, 81, 0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
            borderSide: BorderSide(
              width: 1.3,
              color: Color.fromARGB(255, 230, 81, 0),
            ),
          ),
        );

    return Scaffold(
      appBar: NavBar(
        title: "Reporta una situación",
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
                    child: Text(
                      "Situación",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      controller: valueCtlr,
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
                      controller: valueCtlr2,
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
                      controller: valueCtlr3,
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
                      controller: valueCtlr4,
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
                                    'https://adamix.net/defensa_civil/def/nueva_situacion.php'));
                            // adds all the field in form data format
                            request.fields.addAll({
                              'titulo': valueCtlr.text,
                              'descripcion': valueCtlr2.text,
                              'foto': "",
                              'latitud': valueCtlr3.text,
                              'longitud': valueCtlr4.text,
                              'token':
                                  "", ////// David pon tu el token XDXD XDXDXD
                            });

                            // response result
                            http.StreamedResponse response =
                                await request.send();
                            print(response.headers);
                            if (response.statusCode == 200) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor: Colors.orange.shade900,
                                  content: Text(
                                      "Su situación se ha reportado con éxito!!!!")));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("${response.reasonPhrase}")));
                            }
                          }
                        },
                        child: const Text("Reportar"),
                      ))
                ],
              )),
        ),
      ]),
    );
  }
}
