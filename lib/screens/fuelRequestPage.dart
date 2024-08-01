import 'package:flutter/material.dart';
import 'package:testapp/screens/fuelRequestNewPage.dart';
import 'package:testapp/widget/menuWidget.dart';

class FuelRequestPage extends StatelessWidget {
  const FuelRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> solicitudes = [
      {
        'ID': '91',
        'Fecha': '28/03/24 08:06',
        'Usuario': 'jvillafuerte',
        'Centro de costos': 'CBMTU COMBUSTIBLE',
        'Proyección consumo': '83104',
        'Localidad': 'Test',
        'Cant. solicitada (gal)': '10.02',
        'Despachador': 'tanquero01',
        'Código despacho': 'A60UPV',
        'Estado': 'Confirmar despacho',
      },
      {
        'ID': '92',
        'Fecha': '28/03/24 08:06',
        'Usuario': 'jvillafuerte',
        'Centro de costos': 'CBMTU COMBUSTIBLE',
        'Proyección consumo': '83104',
        'Localidad': 'Test',
        'Cant. solicitada (gal)': '10.02',
        'Despachador': 'tanquero01',
        'Código despacho': 'A60UPV',
        'Estado': 'Confirmar despacho',
      },
      {
        'ID': '91',
        'Fecha': '28/03/24 08:06',
        'Usuario': 'jvillafuerte',
        'Centro de costos': 'CBMTU COMBUSTIBLE',
        'Proyección consumo': '83104',
        'Localidad': 'Test',
        'Cant. solicitada (gal)': '10.02',
        'Despachador': 'tanquero01',
        'Código despacho': 'A60UPV',
        'Estado': 'Confirmar despacho',
      },
      {
        'ID': '92',
        'Fecha': '28/03/24 08:06',
        'Usuario': 'jvillafuerte',
        'Centro de costos': 'CBMTU COMBUSTIBLE',
        'Proyección consumo': '83104',
        'Localidad': 'Test',
        'Cant. solicitada (gal)': '10.02',
        'Despachador': 'tanquero01',
        'Código despacho': 'A60UPV',
        'Estado': 'Confirmar despacho',
      }
      // Agrega más solicitudes aquí
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Align(
            alignment: Alignment.bottomLeft, child: Text('Mis solicitudes')),
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
                        Text(
                          'ID: ${solicitudes[index]['ID']}',
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Fecha: ${solicitudes[index]['Fecha']}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 0.05,
                  ), // Línea de separación
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
                                Text('Usuario:',
                                    style: TextStyle(fontSize: 12)),
                                Text('Centro de costos:',
                                    style: TextStyle(fontSize: 12)),
                                Text('Proyección consumo:',
                                    style: TextStyle(fontSize: 12)),
                                Text('Localidad:',
                                    style: TextStyle(fontSize: 12)),
                                Text('Cant. solicitada (gal):',
                                    style: TextStyle(fontSize: 12)),
                                Text('Despachador:',
                                    style: TextStyle(fontSize: 12)),
                                Text('Código despacho:',
                                    style: TextStyle(fontSize: 12)),
                                Text('Estado:', style: TextStyle(fontSize: 12))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${solicitudes[index]['Usuario']}',
                                    style: const TextStyle(fontSize: 12)),
                                Text(
                                    '${solicitudes[index]['Centro de costos']}',
                                    style: const TextStyle(fontSize: 12)),
                                Text(
                                    '${solicitudes[index]['Proyección consumo']}',
                                    style: const TextStyle(fontSize: 12)),
                                Text('${solicitudes[index]['Localidad']}',
                                    style: const TextStyle(fontSize: 12)),
                                Text(
                                    '${solicitudes[index]['Cant. solicitada (gal)']}',
                                    style: const TextStyle(fontSize: 12)),
                                Text('${solicitudes[index]['Despachador']}',
                                    style: const TextStyle(fontSize: 12)),
                                Text('${solicitudes[index]['Código despacho']}',
                                    style: const TextStyle(fontSize: 12)),
                                Text('${solicitudes[index]['Estado']}',
                                    style: const TextStyle(fontSize: 12))
                              ],
                            )
                          ],
                        ),
                        const Divider(), // Línea de separación
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 109, 108, 108),
                                    foregroundColor: const Color.fromARGB(
                                        255, 223, 221, 221),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          5.0), // 5% del tamaño del botón
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text('${solicitudes[index]['Estado']}',
                                      style: const TextStyle(fontSize: 13))),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      drawer: MenuWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción al presionar el botón
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const FuelRequestNewPage()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 109, 108, 108),
        foregroundColor: const Color.fromARGB(255, 223, 221, 221),
        child: const Icon(Icons.add),
      ),
    );
  }
}
