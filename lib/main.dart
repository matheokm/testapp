import 'package:flutter/material.dart';
import 'package:testapp/screens/dataSyncPage.dart';
import 'package:testapp/screens/profilePage.dart';
import 'package:testapp/screens/transferJournalsNewPage.dart';
import 'package:testapp/screens/fuelRequestNewPage.dart';
import 'package:testapp/screens/fuelRequestPage.dart';
import 'package:testapp/screens/indexPage.dart';
import 'package:testapp/screens/loginPage.dart';
import 'package:testapp/screens/pendingFuelRequestPage.dart';
import 'package:testapp/screens/startPage.dart';
import 'package:testapp/screens/transferJournalsPage.dart';
import 'package:testapp/services/authService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'inter',
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: AuthService().getAccessToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data != null) {
            return IndexPage();
          } else {
            return const StartPage();
          }
        },
      ),
    );
  }

  Map<String, WidgetBuilder> buildRoutes() {
    return {
      '/': (context) => const StartPage(),
      'login': (context) => const LoginPage(),
      'index': (context) => IndexPage(),
      'fuel_request': (context) => const FuelRequestPage(),
      'pending_fuel_request': (context) => const PendingFuelRequestPage(),
      'fuel_request_new': (context) => const FuelRequestNewPage(),
      'transfer_journals': (context) => const TransferJournalsPage(),
      'transfer_journals_new': (context) => const TransferJournalsNewPage(),
      'data_sync': (context) => const DataSyncPage(),
      'profile': (context) => const ProfilePage(),
    };
  }
}
