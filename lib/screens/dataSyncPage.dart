import 'package:flutter/material.dart';
import 'package:testapp/widget/menuWidget.dart';

class DataSyncPage extends StatelessWidget {
  const DataSyncPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sincronización de datos'),
      ),
      drawer: MenuWidget(),
    );
  }
}
