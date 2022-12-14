import 'dart:convert';
import 'dart:io';

import 'package:defensa_civil/views/reporta_tools/valuesProccess.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

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
  final picker = ImagePicker();
  File? image;
  String base64Image = "";

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text("Reportar situación",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  Container(
                    height: 400,
                    padding: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          color: Colors.grey.shade300,
                          child: image != null
                              ? Image(
                                  image: FileImage(image!),
                                  fit: BoxFit.fill,
                                  height: 430,
                                )
                              : const Center(
                                  child: Icon(Icons.image),
                                ),
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              getImage(ImageSource.gallery);
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Icon(Icons.image), Text("Galería")]),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade400,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              minimumSize: Size(140, 50),
                            )),
                        ElevatedButton(
                            onPressed: () async {
                              getImage(ImageSource.camera);
                            },
                            child: Row(
                                children: [Icon(Icons.camera), Text("Cámara")]),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade400,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              minimumSize: Size(140, 50),
                            ))
                      ],
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
                          minimumSize: Size(320, 50),
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
                              'foto': base64Image,
                              'latitud': valueCtlr3.text,
                              'longitud': valueCtlr4.text,
                              'token': Menu.user?.token
                            });

                            // response result
                            http.StreamedResponse response =
                                await request.send();
                            http.Response body =
                                await http.Response.fromStream(response);
                            final parsed =
                                jsonDecode(body.body) as Map<String, dynamic>;

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.orange.shade900,
                                content: Text(parsed["mensaje"])));
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

  void getImage(source) async {
    XFile? imagePicked = await picker.pickImage(source: source);
    setState(() {
      if (imagePicked != null) {
        image = File(imagePicked.path);
        final bytes = File(image!.path).readAsBytesSync();
        // base64Image = "data:image/png;base64," + base64Encode(bytes);
         base64Image = base64Encode(bytes);
      }
    });
  }
}
