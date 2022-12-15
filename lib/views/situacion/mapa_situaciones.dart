import 'package:defensa_civil/models/situacion_model.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaSituaciones extends StatefulWidget {
  MapaSituaciones({Key? key, required this.coords}) : super(key: key);
  List<SituacionModel> coords;

  @override
  _MapaSituacionesState createState() => _MapaSituacionesState();
}

class _MapaSituacionesState extends State<MapaSituaciones> {
  final Completer<GoogleMapController> _controller = Completer();
  final CameraPosition initialState = const CameraPosition(
    target: LatLng(
      18.520208672741386,
      -69.89312606436971,
    ),
    zoom: 8.2,
  );
  final List<Marker> markers = [];

  @override
  void initState() {
    for (int i = 0; i < widget.coords.length; i++) {
      Marker marker = Marker(
        markerId: const MarkerId('Location'),
        position: LatLng(double.parse(widget.coords[i].longitud),
            double.parse(widget.coords[i].latitud)),
        infoWindow: InfoWindow(
          title:
              '${widget.coords[i].titulo.toUpperCase()}\n${widget.coords[i].voluntario.toUpperCase()}',
          snippet: '${widget.coords[i].longitud} ${widget.coords[i].latitud}',
        ),
      );
      markers.add(marker);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
        Factory<OneSequenceGestureRecognizer>(
          () => EagerGestureRecognizer(),
        ),
      },
      mapType: MapType.normal,
      markers: markers.map((e) => e).toSet(),
      initialCameraPosition: initialState,
      onMapCreated: (controller) {
        _controller.complete(controller);

        controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            zoom: 12,
            target: LatLng(double.parse(widget.coords[0].longitud),
                double.parse(widget.coords[0].latitud)))));
      },
    );
  }
}
