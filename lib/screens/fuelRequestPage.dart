import 'package:flutter/material.dart';
import 'package:testapp/widget/menuWidget.dart';

class FuelRequestPage extends StatelessWidget {
  const FuelRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Solicitudes'),
      ),
      drawer: const MenuWidget(),
    );
  }
}
