import 'package:flutter/material.dart';
import 'package:testapp/screens/dataSyncPage.dart';
import 'package:testapp/screens/fuelRequestNewPage.dart';
import 'package:testapp/screens/fuelRequestPage.dart';
import 'package:testapp/screens/loginPage.dart';
import 'package:testapp/screens/pendingFuelRequestPage.dart';
import 'package:testapp/screens/profilePage.dart';
import 'package:testapp/screens/transferJournalsPage.dart';
import 'package:testapp/services/authService.dart';

class MenuWidget extends StatelessWidget {
  final AuthService authService = AuthService();

  MenuWidget({super.key});

  Widget listTile(
      IconData icon, String title, Widget Function() route, BuildContext context) {
    return ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => route()),
          );
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
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 109, 108, 108),
                ),
                child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/menulogo.png', width: 50),
                        const SizedBox(height: 10),
                        const Text(
                          'Despacho de combustible',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 223, 221, 221)),
                        ),
                      ],
                    ))),
            listTile(Icons.description, 'Crear solicitud', () => const FuelRequestNewPage(),
                context),
            listTile(Icons.checklist_rounded, 'Solicitudes por aprobar',
                    () => const  PendingFuelRequestPage(), context),
            listTile(Icons.list_alt_rounded, 'Mis Solicitudes', () => const FuelRequestPage(),
                context),
            listTile(Icons.format_list_numbered, 'Diarios de transferencia',
                    () => const TransferJournalsPage(), context),
            listTile(Icons.sync, 'Sincronizar datos', () => const DataSyncPage(), context),
            const Divider(color: Colors.black45),
            listTile(Icons.account_circle, 'Mi perfil', () => const ProfilePage(), context),
            GestureDetector(
              onTap: () => {
                authService.logout(),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                )
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.elliptical(10, 5),
                      right: Radius.elliptical(10, 5)),
                  color: Color.fromARGB(255, 109, 108, 108),
                ),
                child: const Center(
                  child: Text(
                    'Cerrar sesión',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
