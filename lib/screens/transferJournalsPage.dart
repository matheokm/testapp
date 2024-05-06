import 'package:flutter/material.dart';
import 'package:testapp/widget/menuWidget.dart';

class TransferJournalsPage extends StatelessWidget {
  const TransferJournalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diarios de transferencia'),
      ),
      drawer: const MenuWidget(),
    );
  }
}
