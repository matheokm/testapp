import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  Widget listTile(
      IconData icon, String title, String route, BuildContext context) {
    return ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () {
          Navigator.pop(context);
          Navigator.popAndPushNamed(context, route);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, bottom: 24),
        child: Column(
          children: [
            DrawerHeader(
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
            listTile(Icons.list_alt_rounded, 'Mis Solicitudes', 'fuel_request',
                context),
            listTile(Icons.checklist_rounded, 'Solicitudes por aprobar',
                'pending_fuel_request', context),
            listTile(Icons.description, 'Crear solicitud', 'fuel_request_new',
                context),
            listTile(Icons.format_list_numbered, 'Diarios de transferencia',
                'transfer_journals', context),
            listTile(Icons.sync, 'Sincronizar datos', 'data_sync', context),
            const Divider(color: Colors.black45),
            listTile(Icons.account_circle, 'Mi perfil', 'profile', context),
            listTile(Icons.logout_outlined, 'Cerrar sesión', 'login', context)
          ],
        ),
      ),
    );
  }
}
