import 'package:defensa_civil/views/Historia.dart';
import 'package:defensa_civil/views/Home.dart';
import 'package:defensa_civil/views/Info.dart';
import 'package:defensa_civil/views/Noticias.dart';
import 'package:defensa_civil/views/cambiar_clave.dart';
import 'package:defensa_civil/views/iniciar_sesion.dart';
import 'package:defensa_civil/views/reporta.dart';
import 'package:defensa_civil/views/servicio/servicios.dart';
import 'package:defensa_civil/views/albergue/albergues.dart';
import 'package:defensa_civil/views/situacion/mapa_situaciones.dart';
import 'package:defensa_civil/views/situacion/situaciones.dart';
import 'package:defensa_civil/views/video/Videos.dart';
import 'package:defensa_civil/views/Voluntario.dart';
import 'package:defensa_civil/views/medidas_preventivas.dart';
import 'package:defensa_civil/views/miembros.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // ignore: prefer_final_fields
  GoRouter _router = GoRouter(routes: <GoRoute>[
    GoRoute(path: '/', builder: (context, state) => const InicioSesion()),
    GoRoute(path: '/inicio', builder: (context, state) => const Home()),
    GoRoute(path: '/historia', builder: (context, state) => const Historia()),
    GoRoute(path: '/servicios', builder: (context, state) => Servicios()),
    GoRoute(path: '/noticias', builder: (context, state) => Noticias()),
    GoRoute(path: '/videos', builder: (context, state) => Videos()),
    GoRoute(path: '/albergues', builder: (context, state) => Albergues()),
    GoRoute(
        path: '/medidas', builder: (context, state) => MedidasPreventivas()),
    GoRoute(path: '/miembros', builder: (context, state) => Miembros()),
    GoRoute(
        path: '/voluntario', builder: (context, state) => const Voluntario()),
    GoRoute(path: '/info', builder: (context, state) => const Info()),
    GoRoute(path: '/reporta', builder: ((context, state) => const Reporta())),
    GoRoute(
        path: '/inicio_sesion', builder: ((context, state) => InicioSesion())),
    GoRoute(
        path: '/cambiar_clave', builder: ((context, state) => CambiarClave())),
    GoRoute(path: '/situaciones', builder: ((context, state) => Situaciones())),
    GoRoute(
        path: '/mapa_situaciones',
        builder: ((context, state) => MapaSituaciones(
              coords: [],
            ))),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
          primaryColor: Colors.orange.shade900,
          secondaryHeaderColor: Colors.blue.shade900,
          textTheme: TextTheme(
              labelLarge: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal),
              bodyLarge: TextStyle(color: Colors.blue.shade900),
              labelMedium: TextStyle(color: Colors.orange.shade900),
              headlineSmall: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              displaySmall: TextStyle(color: Colors.white))),
    );
  }
}
