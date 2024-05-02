import 'package:flutter/material.dart';
import 'package:testapp/screens/listado.dart';
import 'package:testapp/screens/loginPage.dart';
import 'package:testapp/screens/test/favourite_screen.dart';
import 'package:testapp/screens/test/home_screen.dart';
import 'package:testapp/screens/test/user_profile_screen.dart';

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Listado()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text('Cerrar sesión'),
                onTap: () {
                  // Agrega el código para manejar la selección de la opción 2
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
              )
            ])
          ],
        ),
      ),
    );
  }
}
