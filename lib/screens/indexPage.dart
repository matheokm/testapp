import 'package:flutter/material.dart';
import 'package:testapp/screens/fuelRequestPage.dart';
import 'package:testapp/screens/loginPage.dart';
import 'package:testapp/services/authService.dart';
import 'package:testapp/widget/menuWidget.dart';

class IndexPage extends StatelessWidget {
  final AuthService authService = AuthService();

  IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FuelRequestPage()),
      );
    });
    return Scaffold(
      drawer: MenuWidget(),
    );
  }
}
