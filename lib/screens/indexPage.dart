import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        // Agrega el icono del menú hamburguesa al AppBar
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context)
                    .openDrawer(); // Abre el Drawer al presionar el icono del menú
              },
            );
          },
        ),
      ),
      // Agrega el contenido de la página aquí
      body: const Center(
        child: Text("Contenido de la página"),
      ),
      // Agrega el Drawer para el menú hamburguesa
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255,
                      255), // Color de fondo del encabezado del Drawer
                ),
                child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/menulogo.png', // Ruta de la imagen
                          width: 50, // Ancho de la imagen
                        ),
                        const SizedBox(
                            height: 10), // Espacio entre la imagen y el texto
                        const Text(
                          'Despacho de combustible', // Texto opcional para el encabezado del Drawer
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ))),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Mi perfil'),
              onTap: () {
                // Agrega el código para manejar la selección de la opción 2
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt_rounded),
              title: const Text('Mis Solicitudes'),
              onTap: () {
                // Agrega el código para manejar la selección de la opción 1
              },
            ),
            ListTile(
              leading: const Icon(Icons.checklist_rounded),
              title: const Text('Solicitudes por aprobar'),
              onTap: () {
                // Agrega el código para manejar la selección de la opción 2
              },
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Crear solicitud'),
              onTap: () {
                // Agrega el código para manejar la selección de la opción 2
              },
            ),
            ListTile(
              leading: const Icon(Icons.format_list_numbered),
              title: const Text('Diarios de transferencia'),
              onTap: () {
                // Agrega el código para manejar la selección de la opción 2
              },
            ),
            ListTile(
              leading: const Icon(Icons.sync),
              title: const Text('Sincronizar datos'),
              onTap: () {
                // Agrega el código para manejar la selección de la opción 2
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('Cerrar sesión'),
              onTap: () {
                // Agrega el código para manejar la selección de la opción 2
              },
            ),
          ],
        ),
      ),
    );
  }
}
