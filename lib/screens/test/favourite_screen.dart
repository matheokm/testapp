import 'package:flutter/material.dart';
import 'package:testapp/widget/DrawerWidget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
        backgroundColor: Colors.amber,
      ),
      drawer: const DrawerWidget(),
    );
  }
}
