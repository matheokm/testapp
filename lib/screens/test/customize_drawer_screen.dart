import 'package:flutter/material.dart';
import 'package:testapp/widget/DrawerWidget.dart';

class CustomizeDrawerScreen extends StatelessWidget {
  const CustomizeDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Customize Drawer'),
        ),
        drawer: const DrawerWidget(),
      ),
    );
  }
}
