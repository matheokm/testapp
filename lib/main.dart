import 'package:flutter/material.dart';
import 'package:testapp/screens/editar.dart';
import 'package:testapp/screens/indexPage.dart';
import 'package:testapp/screens/listado.dart';
import 'package:testapp/screens/loginPage.dart';
import 'package:testapp/screens/startPage.dart';
import 'package:testapp/screens/test/customize_drawer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: ('inter'),
          useMaterial3: true,
        ),
        initialRoute: '/', // Ruta inicial
        routes: {
          '/': (context) => const StartPage(),
          'login': (context) => const LoginPage(),
          'index': (context) => const IndexPage(),
          'listado': (context) => const Lista(),
          'editar': (context) => Editar(), // Ruta para la página de inicio
          // Agrega más rutas según sea necesario para otras páginas
          // Por ejemplo:
          // '/other': (context) => OtherPage(),
        });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: const StartPage(),
  //   );
  // }
}
