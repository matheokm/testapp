import 'package:flutter/material.dart';
import 'package:testapp/widget/menuWidget.dart';

class TransferJournalsNewPage extends StatelessWidget {
  const TransferJournalsNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diario de transferencia'),
      ),
      drawer: const MenuWidget(),
    );
  }
}
