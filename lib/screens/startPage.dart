import 'package:flutter/material.dart';
import 'package:testapp/screens/loginPage.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 223, 221, 221)),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 150.0),
            child: Image(
              image: AssetImage('assets/logo.png'),
              height: 270,
            ),
          ),
          const SizedBox(height: 25),
          const Text('Bienvenido',
              style: TextStyle(
                  fontSize: 25, color: Color.fromRGBO(109, 108, 108, 1))),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: Container(
              height: 55,
              width: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.elliptical(10, 5),
                    right: Radius.elliptical(10, 5)),
                color: Color.fromARGB(255, 109, 108, 108),
              ),
              child: const Center(
                child: Text(
                  'Iniciar sesión',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
