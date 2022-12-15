import 'package:defensa_civil/layout/navbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/medidas_preventivas_models.dart';
import 'package:flutter/material.dart';

class MedidasPreventivasDetalle extends StatefulWidget {
  const MedidasPreventivasDetalle({Key? key, required this.medidas_preventivas})
      : super(key: key);
  final MedidasPreventivasModel medidas_preventivas;

  @override
  _MedidasPreventivasDetalleState createState() =>
      _MedidasPreventivasDetalleState();
}

class _MedidasPreventivasDetalleState extends State<MedidasPreventivasDetalle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: NavBar(title: widget.medidas_preventivas.titulo),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.blue.shade800,
                      width: 4,
                    ),
                  ),
                ),
                child: Image(
                  image: NetworkImage(widget.medidas_preventivas.foto),
                  fit: BoxFit.cover,
                ),
                height: 400,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              widget.medidas_preventivas.descripcion,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
