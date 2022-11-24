import 'dart:async';
import 'package:defensa_civil/models/albergues_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  Mapa({Key? key, required this.coords}) : super(key: key);
  List<AlberguesModel> coords;

  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  final Completer<GoogleMapController> _controller = Completer();
  final CameraPosition initialState = const CameraPosition(
      target: LatLng(18.520208672741386, -69.89312606436971), zoom: 8.2);

  final List<Marker> markers = [];

  @override
  void initState() {
    for (int i = 0; i < widget.coords.length; i++) {
      Marker marker = Marker(
        markerId: const MarkerId('Location'),
        position: LatLng(double.parse(widget.coords[i].lng),
            double.parse(widget.coords[i].lat)),
        infoWindow: InfoWindow(
          title:
              '${widget.coords[i].edificio.toUpperCase()}\n${widget.coords[i].ciudad.toUpperCase()}',
          snippet: '${widget.coords[i].lng} ${widget.coords[i].lat}',
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

        // Marker marker = Marker(
        //   markerId: const MarkerId('Location'),
        //   position: LatLng(
        //       double.parse(widget.coords.lng), double.parse(widget.coords.lat)),
        //   infoWindow: InfoWindow(
        //     title:
        //         '${widget.coords.edificio.toUpperCase()}\n${widget.coords.ciudad.toUpperCase()}',
        //     snippet: '${widget.coords.lng} ${widget.coords.lat}',
        //   ),
        // );

        // controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        //     zoom: 15,
        //     target: LatLng(double.parse(widget.coords.lng),
        //         double.parse(widget.coords.lat)))));
      },
    );
  }
}
