import 'package:flutter/material.dart';
import 'package:testapp/models/note.dart';
import 'package:testapp/utils/db_helper.dart';

class Editar extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final tituloController = TextEditingController();
  final descripcionController = TextEditingController();

  Editar({super.key});

  get value => null;

  @override
  Widget build(BuildContext context) {
    Note note = ModalRoute.of(context)!.settings.arguments as Note;
    tituloController.text = note.title;
    descripcionController.text = note.description;

    return Scaffold(
        appBar: AppBar(title: const Text("Guardar")),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: tituloController,
                        decoration: const InputDecoration(
                          labelText: 'titulo',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor ingresa un titulo';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: descripcionController,
                        decoration: const InputDecoration(
                          labelText: 'descripción',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor ingresa una descripción';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (note.id! > 0) {
                                note.title = tituloController.text;
                                note.description = descripcionController.text;
                                DatabaseHelper.update(note);
                              } else {
                                DatabaseHelper.insert(Note(
                                    title: tituloController.text,
                                    description: descripcionController.text,
                                    id: null));
                              }
                              Navigator.pushNamed(context, "/");
                            }
                          },
                          child: const Text('Enviar'),
                        ),
                      ),
                    ]))));
  }
}
