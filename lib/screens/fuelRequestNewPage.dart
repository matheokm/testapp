import 'package:flutter/material.dart';
import 'package:testapp/widget/menuWidget.dart';

class FuelRequestNewPage extends StatelessWidget {
  const FuelRequestNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> equipos = [
      'cbmtu',
      'cbmtu-01',
      'cbmtu-11',
      'cbmtu-21',
      'cbmtu-31'
    ];
    final List<String> centroCostos = [
      '83104 - combustible',
      '102104 - combustible',
      '21104 - combustible'
    ];
    final List<String> tipoCombustible = [
      'Diesel filtrado',
      'Diesel 2 petrolero',
      'Diesel premium'
    ];
    final List<String> tipoDespacho = [
      'Gasolinera',
      'Tanque estacionario',
      'Tanquero',
      'Tanque almacenamiento en campo'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Align(
            alignment: Alignment.bottomLeft,
            child: Text('Solicitud de combustible')),
        backgroundColor: const Color.fromARGB(255, 109, 108, 108),
        foregroundColor: const Color.fromARGB(255, 223, 221, 221),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return equipos.where((String option) {
                    return option.contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  print('Has seleccionado: $selection');
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController textEditingController,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted) {
                  return TextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    onFieldSubmitted: (String value) {
                      onFieldSubmitted();
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(
                        'Equipos',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 109, 108, 108),
                        ),
                      ),
                      suffixIcon: Icon(Icons.qr_code_scanner),
                    ),
                  );
                },
              ),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return centroCostos.where((String option) {
                    return option.contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  print('Has seleccionado: $selection');
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController textEditingController,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted) {
                  return TextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    onFieldSubmitted: (String value) {
                      onFieldSubmitted();
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(
                        'Centro de costos',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 109, 108, 108),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      'Cantidad solicitada (gal)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 109, 108, 108),
                      ),
                    )),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Tipo de combustible',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 109, 108, 108),
                    ),
                  ),
                ),
                items: tipoCombustible.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Tipo de despacho',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 109, 108, 108),
                    ),
                  ),
                ),
                items: tipoDespacho.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      'Locación',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 109, 108, 108),
                      ),
                    )),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
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
      ),
      drawer: const MenuWidget(),
    );
  }
}
