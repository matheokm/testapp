import 'package:flutter/material.dart';
import 'package:testapp/widget/menuWidget.dart';

class TransferJournalsPage extends StatelessWidget {
  const TransferJournalsPage({super.key});
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
        title: const Text('Diarios de transferencia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              DropdownButtonFormField<String>(
                hint: const Text('Tipo de combustible'),
                items:
                    <String>['Gasolina', 'Diesel', 'Gas'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Cantidad (gal)'),
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
                      hintText: 'Localidad origen',
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
                      hintText: 'Localidad destino',
                    ),
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Descripción'),
                maxLines: 2,
              ),
              ElevatedButton(
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
