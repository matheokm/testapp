import 'package:flutter/material.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
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
                items:
                    <String>['Gasolina', 'Diesel', 'Gas'].map((String value) {
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
                      'Cantidad (gal)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 109, 108, 108),
                      ),
                    )),
              ),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return localidades.where((String option) {
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
                        'Localidad origen',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 109, 108, 108),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return localidades.where((String option) {
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
                        'Localidad destino',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 109, 108, 108),
                        ),
                      ),
                    ),
                  );
                },
              ),
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
