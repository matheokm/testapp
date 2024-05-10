import 'package:flutter/material.dart';
import 'package:testapp/widget/menuWidget.dart';

class PendingFuelRequestPage extends StatelessWidget {
  const PendingFuelRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> solicitudes = [
      {
        'ID': '91',
        'Fecha': '28/03/24 08:06',
        'Usuario': 'jvillafuerte',
        'Proyecto':'CBMTU',
        'Centro': '83104',
        'Localidad': 'Test',
        'CantSolicitada': '10.02',
        'TipoDespacho': 'tanquero',
        'CódigoDespacho': 'A60UPV',
        'Estado':'Test',
        'Aprobacion':{
          'supervisor': false,
          'warehouse': false,
          'dispatcher': false,
          'customer': false
        }
      },
      {
        'ID': '92',
        'Fecha': '28/03/24 08:06',
        'Usuario': 'jvillafuerte',
        'Proyecto':'CBMTU',
        'Centro': '83104',
        'Localidad': 'Test',
        'CantSolicitada': '10.02',
        'TipoDespacho': 'tanquero',
        'CódigoDespacho': 'A60UPV',
        'Estado':'Test',

      },
      // Agrega más solicitudes aquí
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Align(
            alignment: Alignment.bottomLeft,
            child: Text('Solicitudes pendientes')
        ),
        backgroundColor: Color.fromARGB(255, 109, 108, 108),
        foregroundColor: Color.fromARGB(255, 223, 221, 221),
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
                  const Divider(height: 0.05,), // Línea de separación
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
                                Text('Usuario:', style: TextStyle(fontSize: 12)),
                                Text('Proyección consumo:', style: TextStyle(fontSize: 12)),
                                Text('Centro de costos:', style: TextStyle(fontSize: 12)),
                                Text('Localición:', style: TextStyle(fontSize: 12)),
                                Text('Cant. solicitada (gal):', style: TextStyle(fontSize: 12)),
                                Text('Tipo de despacho:', style: TextStyle(fontSize: 12)),
                                Text('Código despacho:', style: TextStyle(fontSize: 12))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${solicitudes[index]['Usuario']}', style: const TextStyle(fontSize: 12)),
                                Text('${solicitudes[index]['Proyecto']}', style: const TextStyle(fontSize: 12)),
                                Text('${solicitudes[index]['Centro']}', style: const TextStyle(fontSize: 12)),
                                Text('${solicitudes[index]['Localidad']}', style: const TextStyle(fontSize: 12)),
                                Text('${solicitudes[index]['CantSolicitada']}', style: const TextStyle(fontSize: 12)),
                                Text('${solicitudes[index]['TipoDespacho']}', style: const TextStyle(fontSize: 12)),
                                Text('${solicitudes[index]['CódigoDespacho']}', style: const TextStyle(fontSize: 12))
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
                                    backgroundColor: const Color.fromARGB(255, 109, 108, 108),
                                    foregroundColor: const Color.fromARGB(255, 223, 221, 221),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0), // 5% del tamaño del botón
                                    ),
                                  ),
                                  onPressed: (){},
                                  child: const Text('Ver detalle', style: TextStyle(fontSize: 13))
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: const Color.fromARGB(255, 223, 221, 221),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0), // 5% del tamaño del botón
                                    ),
                                  ),
                                  onPressed: (){},
                                  child: const Text('Aprobar', style: TextStyle(fontSize: 13))
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: const Color.fromARGB(255, 223, 221, 221),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0), // 5% del tamaño del botón
                                    ),
                                  ),
                                  onPressed: (){},
                                  child: const Text('Rechazar', style: TextStyle(fontSize: 13))
                              ),
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
      drawer: const MenuWidget(),

    );
  }
}
