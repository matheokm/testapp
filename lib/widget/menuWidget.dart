import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: [
              ListTile(
                leading: const Icon(Icons.list_alt_rounded),
                title: const Text('Mis Solicitudes'),
                onTap: () {
                  Navigator.pop(context);
                  // Agrega el código para manejar la selección de la opción 1
                  Navigator.pushNamed(context, 'fuel_request');
                },
              ),
              ListTile(
                leading: const Icon(Icons.checklist_rounded),
                title: const Text('Solicitudes por aprobar'),
                onTap: () {
                  Navigator.pop(context);
                  // Agrega el código para manejar la selección de la opción 2
                  Navigator.pushNamed(context, 'pending_fuel_request');
                },
              ),
              ListTile(
                leading: const Icon(Icons.description),
                title: const Text('Crear solicitud'),
                onTap: () {
                  Navigator.pop(context);
                  // Agrega el código para manejar la selección de la opción 3
                  Navigator.pushNamed(context, 'fuel_request_new');
                },
              ),
              ListTile(
                leading: const Icon(Icons.format_list_numbered),
                title: const Text('Diarios de transferencia'),
                onTap: () {
                  Navigator.pop(context);
                  // Agrega el código para manejar la selección de la opción 4
                  Navigator.pushNamed(context, 'transfer_journals');
                },
              ),
              ListTile(
                leading: const Icon(Icons.sync),
                title: const Text('Sincronizar datos'),
                onTap: () {
                  Navigator.pop(context);
                  // Agrega el código para manejar la selección de la opción 5
                  Navigator.pushNamed(context, 'data_sync');
                },
              ),
              const Divider(
                color: Colors.black45,
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Mi perfil'),
                onTap: () {
                  // Agrega el código para manejar la selección de la opción 2
                  Navigator.pop(context); // Cierra el Drawer
                  // Navega a la página de inicio
                  Navigator.pushNamed(context, 'profile');
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text('Cerrar sesión'),
                onTap: () {
                  // Agrega el código para manejar la selección de la opción 2
                  Navigator.pushNamed(context, 'login');
                },
              )
            ])
          ],
        ),
      ),
    );
  }
}
