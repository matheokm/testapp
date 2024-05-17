import 'package:flutter/material.dart';
import 'package:testapp/widget/menuWidget.dart';

class TransferJournalsPage extends StatelessWidget {
  const TransferJournalsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> solicitudes = [
      {
        'ID': '91',
        'Fecha': '28/03/24 08:06',
        'Usuario': 'jvillafuerte',
        'TipoCombustible': 'Diesel filtrado',
        'CantSolicitada': '-10.02',
        'BodOrigen': '13A-177 - Bodega_Principal_Coca',
        'BodDestino': '13A-177 - Bodega_Principal_Coca',
        'Dynamics': 'DI-00073679',
        'Descripcion': 'Test 1'
      },
      {
        'ID': '92',
        'Fecha': '28/03/24 08:06',
        'Usuario': 'jvillafuerte',
        'TipoCombustible': 'Diesel filtrado',
        'CantSolicitada': '-10.02',
        'BodOrigen': '13A-177 - Bodega_Principal_Coca',
        'BodDestino': '13A-177 - Bodega_Principal_Coca',
        'Dynamics': 'DI-00073679',
        'Descripcion': 'Test 2'
      },
      {
        'ID': '93',
        'Fecha': '28/03/24 08:06',
        'Usuario': 'jvillafuerte',
        'TipoCombustible': 'Diesel filtrado',
        'Cant. solicitada (gal)': '-10.02',
        'BodOrigen': '13A-177 - Bodega_Principal_Coca',
        'BodDestino': '13A-177 - Bodega_Principal_Coca',
        'Dynamics': 'DI-00073679',
        'Descripcion': 'Test 3'
      }
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Align(
              alignment: Alignment.bottomLeft,
              child: Text('Diarios de transferencia')),
          backgroundColor: const Color.fromARGB(255, 109, 108, 108),
          foregroundColor: const Color.fromARGB(255, 223, 221, 221),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: solicitudes.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'ID: ${solicitudes[index]['ID']}',
                              textAlign: TextAlign.left,
                              style: const TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              'Fecha: ${solicitudes[index]['Fecha']}',
                              textAlign: TextAlign.right,
                              style: const TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 0.05), // Línea de separación
                    ListTile(
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Usuario: ',
                                      style: TextStyle(fontSize: 12)),
                                  Text('Tipo combustible: ',
                                      style: TextStyle(fontSize: 12)),
                                  Text('Cantidad solicitada (gal): ',
                                      style: TextStyle(fontSize: 12)),
                                  Text('Bodega origen: ',
                                      style: TextStyle(fontSize: 12)),
                                  Text('Bodega destino: ',
                                      style: TextStyle(fontSize: 12)),
                                  Text('Diario Dynamics: ',
                                      style: TextStyle(fontSize: 12)),
                                  Text('Descripción: ',
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${solicitudes[index]['Usuario']}',
                                        style: const TextStyle(fontSize: 12)),
                                    Text(
                                        '${solicitudes[index]['TipoCombustible']}',
                                        style: const TextStyle(fontSize: 12)),
                                    Text(
                                        '${solicitudes[index]['CantSolicitada']}',
                                        style: const TextStyle(fontSize: 12)),
                                    Text(
                                      '${solicitudes[index]['BodOrigen']}',
                                      style: const TextStyle(fontSize: 12),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '${solicitudes[index]['BodDestino']}',
                                      style: const TextStyle(fontSize: 12),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text('${solicitudes[index]['Dynamics']}',
                                        style: const TextStyle(fontSize: 12)),
                                    Text('${solicitudes[index]['Descripcion']}',
                                        style: const TextStyle(fontSize: 12))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        drawer: const MenuWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Acción al presionar el botón
            Navigator.popAndPushNamed(context, 'transfer_journals_new');
          },
          backgroundColor: const Color.fromARGB(255, 109, 108, 108),
          foregroundColor: const Color.fromARGB(255, 223, 221, 221),
          child: const Icon(Icons.add),
        ));
  }
}
