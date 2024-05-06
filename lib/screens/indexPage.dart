import 'package:flutter/material.dart';
import 'package:testapp/widget/menuWidget.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.popAndPushNamed(context, 'fuel_request');
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Despacho de combustible')),
      drawer: const MenuWidget(),
    );
  }
}
