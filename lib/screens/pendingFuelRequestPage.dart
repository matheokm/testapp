import 'package:flutter/material.dart';
import 'package:testapp/widget/menuWidget.dart';

class PendingFuelRequestPage extends StatelessWidget {
  const PendingFuelRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitudes Pendientes'),
      ),
      drawer: const MenuWidget(),
    );
  }
}
