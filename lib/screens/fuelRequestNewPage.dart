import 'package:flutter/material.dart';
import 'package:testapp/widget/menuWidget.dart';

class FuelRequestNewPage extends StatelessWidget {
  const FuelRequestNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitud de combustible'),
      ),
      drawer: const MenuWidget(),
    );
  }
}
