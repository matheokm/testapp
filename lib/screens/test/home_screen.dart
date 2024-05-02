import 'package:flutter/material.dart';
import 'package:testapp/widget/DrawerWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.green,
      ),
      drawer: const DrawerWidget(),
    );
  }
}
