import 'package:flutter/material.dart';
import 'package:testapp/screens/editar.dart';
import 'package:testapp/screens/listado.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Demo',
      theme: ThemeData(primarySwatch: Colors.lime),
      home: const MiApp(),
    );
  }
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: "/", routes: {
      "/": (context) => Listado(),
      "/editar": (context) => Editar()
    });
  }
}
