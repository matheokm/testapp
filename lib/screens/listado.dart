import 'dart:core';

import 'package:flutter/material.dart';
import 'package:testapp/models/note.dart';
import 'package:testapp/utils/db_helper.dart';

class Listado extends StatelessWidget {
  const Listado({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notas"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, "/editar",
                arguments: Note(id: 0, title: "", description: ""));
          },
        ),
        body: const Lista());
  }
}

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  MiLista createState() => MiLista();
}

class MiLista extends State<Lista> {
  List<Note> notes = [];

  @override
  void initState() {
    cargaAnimales();
    super.initState();
  }

  cargaAnimales() async {
    List<Note> auxNote = await DatabaseHelper.listar();
    setState(() {
      notes = auxNote;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, i) => Dismissible(
            key: Key(i.toString()),
            direction: DismissDirection.startToEnd,
            background: Container(
                color: Colors.red,
                padding: const EdgeInsets.only(left: 5),
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.delete, color: Colors.white))),
            onDismissed: (direction) {
              DatabaseHelper.delete(notes[i]);
            },
            child: ListTile(
                title: Text('${notes[i].title}-${notes[i].description}'),
                trailing: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/editar",
                          arguments: notes[i]);
                    },
                    child: const Icon(Icons.edit)))));
  }
}
