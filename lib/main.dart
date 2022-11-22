import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // ignore: prefer_final_fields
  GoRouter _router = GoRouter(routes: <GoRoute>[
    GoRoute(path: '/',builder: (context, state) => const Text("a")),

  ]);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
        primaryColor: Colors.orange.shade900,
        secondaryHeaderColor: Colors.blue.shade900
      ),
    );
  }
}
