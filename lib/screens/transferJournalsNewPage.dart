import 'package:flutter/material.dart';
import 'package:testapp/widget/autocompleteWidget.dart';
import 'package:testapp/widget/dropdownWidget.dart';
import 'package:testapp/widget/menuWidget.dart';

class TransferJournalsNewPage extends StatelessWidget {
  const TransferJournalsNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> localidades = [
      'Quito',
      'Guayaquil',
      'Cuenca',
      'Loja',
      'Ambato'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Align(
            alignment: Alignment.bottomLeft,
            child: Text('Diario de transferencia')),
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
    Future<List<String>> fetchWarehouseLocation(String query) async {
      List<String> centroCostos = [
        'PT_01 - 1 - 11A001 - producto terminado',
        'PT_01 - 1 - 11A012 - producto terminado',
        'PT_01 - 1 - 11A020 - producto terminado'
      ];
      // Simulando una llamada a una API con un retraso.
      await Future.delayed(const Duration(seconds: 1));
      // Retorna una lista de sugerencias basadas en el query.
      return centroCostos
          .where((centroCostos) =>
              centroCostos.toString().contains(query.toLowerCase()))
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

    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
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
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Cantidad (gal)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 109, 108, 108),
                    ),
                  )),
            ),
            const SizedBox(height: 20),
            AutocompleteWidget(
              labelWidget: "Localidad origen",
              fetchSuggestions: fetchWarehouseLocation,
              showQRScanner: false,
            ),
            const SizedBox(height: 20),
            AutocompleteWidget(
              labelWidget: "Localidad destino",
              fetchSuggestions: fetchWarehouseLocation,
              showQRScanner: false,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Descripción',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 109, 108, 108),
                    ),
                  )),
              maxLines: 2,
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
            ),
          ],
        ),
      ),
    );
  }
}
