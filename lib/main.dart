import 'package:defensa_civil/views/Historia.dart';
import 'package:defensa_civil/views/Home.dart';
import 'package:defensa_civil/views/Info.dart';
import 'package:defensa_civil/views/Noticias.dart';
import 'package:defensa_civil/views/Servicios.dart';
import 'package:defensa_civil/views/albergue/albergues.dart';
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
    GoRoute(path: '/',builder: (context, state) => const Home()),
    GoRoute(path: '/historia',builder: (context, state) => const Historia()),
    GoRoute(path: '/servicios',builder: (context, state) => const Servicios()),
    GoRoute(path: '/noticias',builder: (context, state) => Noticias()),
    GoRoute(path: '/videos',builder: (context, state) => Videos()),
    GoRoute(path: '/albergues',builder: (context, state) => Albergues()),
    GoRoute(path: '/medidas',builder: (context, state) => const MedidasPreventivas()),
    GoRoute(path: '/miembros',builder: (context, state) => const Miembros()),
    GoRoute(path: '/voluntario',builder: (context, state) => const Voluntario()),
    GoRoute(path: '/info',builder: (context, state) => const Info()),
  ]);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
        primaryColor: Colors.orange.shade900,
        secondaryHeaderColor: Colors.blue.shade900,
        textTheme: TextTheme(
          labelLarge: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.blue.shade900),
          labelMedium: TextStyle(color: Colors.orange.shade900),
          headlineSmall: TextStyle(color: Colors.blue.shade900,fontSize: 18,fontWeight: FontWeight.bold)
        )
      ),
    );
  }
}
