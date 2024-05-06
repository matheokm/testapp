import 'package:flutter/material.dart';
import 'package:testapp/widget/menuWidget.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Despacho de combustible')),
      drawer: const MenuWidget(),
    );
  }
}
