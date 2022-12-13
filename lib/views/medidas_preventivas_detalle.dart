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
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 55),
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 3,
                  color: Colors.white,
                )),
                child: Image(
                  //alignment: Alignment.center,
                  image: NetworkImage(widget.medidas_preventivas.foto),
                  fit: BoxFit.cover,
                ),
                height: 320,
              ),
              AppBar(
                backgroundColor: Colors.orange.shade900,
              ),
              Container(
                padding: EdgeInsets.only(top: 19),
                margin: EdgeInsets.only(left: 40, right: 40),
                alignment: Alignment.center,
                child: Text(widget.medidas_preventivas.titulo,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Text(
              widget.medidas_preventivas.descripcion,
              //textAlign: TextAlign.center,
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
