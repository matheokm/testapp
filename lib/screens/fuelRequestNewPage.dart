// ignore: file_names
import 'package:flutter/material.dart';
import 'package:testapp/widget/autocompleteWidget.dart';
import 'package:testapp/widget/camaraWidget.dart';
import 'package:testapp/widget/dropdownWidget.dart';
import 'package:testapp/widget/menuWidget.dart';

class FuelRequestNewPage extends StatelessWidget {
  const FuelRequestNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
            alignment: Alignment.bottomLeft,
            child: Text('Solicitud de combustible')),
        backgroundColor: const Color.fromARGB(255, 109, 108, 108),
        foregroundColor: const Color.fromARGB(255, 223, 221, 221),
      ),
      body: const MyScrollView(),
      drawer: const MenuWidget(),
    );
  }
}

class MyScrollView extends StatelessWidget {
  const MyScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<String>> fetchConsumers(String query) async {
      List<String> equipos = [
        'cbmtu',
        'abmtu-01',
        'bbmtu-11',
        'dbmtu-21',
        'ebmtu-31'
      ];
      // Simulando una llamada a una API con un retraso.
      await Future.delayed(const Duration(seconds: 1));
      // Retorna una lista de sugerencias basadas en el query.
      return equipos
          .where((equipo) => equipo.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    Future<List<String>> fetchCenterCost(String query) async {
      List<String> centroCostos = [
        '83104 - combustible',
        '102104 - combustible',
        '21104 - combustible'
      ];
      // Simulando una llamada a una API con un retraso.
      await Future.delayed(const Duration(seconds: 1));
      // Retorna una lista de sugerencias basadas en el query.
      return centroCostos
          .where((centroCostos) =>
              centroCostos.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    Future<List<String>> fetchFuelType(String query) async {
      List<String> tipoCombustible = [
        'Diesel filtrado',
        'Diesel 2 petrolero',
        'Diesel premium'
      ];
      // Simulando una llamada a una API con un retraso.
      await Future.delayed(const Duration(seconds: 1));
      // Retorna una lista de sugerencias basadas en el query.
      return tipoCombustible
          .where((tipoCombustible) =>
              tipoCombustible.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    Future<List<String>> fetchDispatcherType(String query) async {
      List<String> tipoDespacho = [
        'Gasolinera',
        'Tanque estacionario',
        'Tanquero',
        'Tanque almacenamiento en campo'
      ];
      // Simulando una llamada a una API con un retraso.
      await Future.delayed(const Duration(seconds: 1));
      // Retorna una lista de sugerencias basadas en el query.
      return tipoDespacho
          .where((tipoDespacho) =>
              tipoDespacho.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(height: 20),
            AutocompleteWidget(
              labelWidget: "Equipos",
              fetchSuggestions: fetchConsumers,
              showQRScanner: true,
            ),
            const SizedBox(height: 20),
            AutocompleteWidget(
              labelWidget: "Centro de costos",
              fetchSuggestions: fetchCenterCost,
              showQRScanner: false,
            ),
            const SizedBox(height: 20),
            FutureBuilder<List<String>>(
              future: fetchFuelType(''),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                      color: Color.fromARGB(255, 109, 108, 108));
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No data available');
                } else {
                  return DropdownWidget(
                    items: snapshot.data!,
                    onChanged: (value) {
                      print('Selected dispatcher type: $value');
                    },
                    hint: 'Tipo de combustible',
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            FutureBuilder<List<String>>(
              future: fetchDispatcherType(''),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                      color: Color.fromARGB(255, 109, 108, 108));
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No data available');
                } else {
                  return DropdownWidget(
                    items: snapshot.data!,
                    onChanged: (value) {
                      print('Selected dispatcher type: $value');
                    },
                    hint: 'Tipo de despacho',
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cantidad solicitada (gal)',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 109, 108, 108),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Espacio entre los widgets
                CameraWidget(), // Aquí se coloca el widget de la cámara
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(140, 60),
                backgroundColor: const Color.fromARGB(255, 109, 108, 108),
                foregroundColor: const Color.fromARGB(255, 223, 221, 221),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(5.0), // 5% del tamaño del botón
                ),
              ),
              onPressed: () {
                // Guardar la información
              },
              child: const Text('Guardar'),
            )
          ],
        ),
      ),
    );
  }
}
