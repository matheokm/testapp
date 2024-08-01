import 'package:flutter/material.dart';
import 'package:testapp/widget/menuWidget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
      ),
      drawer: MenuWidget(),
    );
  }
}
