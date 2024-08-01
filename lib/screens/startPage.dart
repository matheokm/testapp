import 'package:flutter/material.dart';
import 'package:testapp/screens/loginPage.dart';
import 'package:testapp/utils/constants.dart';

import '../widget/custom_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 150.0),
              child: Image(
                image: AssetImage('assets/logo.png'),
                height: 270,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Bienvenido',
              style: TextStyle(
                fontSize: 25,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 25),
            CustomButton(
              text: 'Iniciar sesión',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
