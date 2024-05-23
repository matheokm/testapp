import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRWidget extends StatefulWidget {
  final Function(String) onScanned;

  const ScanQRWidget({super.key, required this.onScanned});

  @override
  // ignore: library_private_types_in_public_api
  QRScannerWidgetState createState() => QRScannerWidgetState();
}

class QRScannerWidgetState extends State<ScanQRWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escanear QR'),
        backgroundColor: const Color.fromARGB(255, 109, 108, 108),
        foregroundColor: const Color.fromARGB(255, 223, 221, 221),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: QRView(
              key: qrKey,
              onQRViewCreated: onQRView,
            ),
          ),
        ],
      ),
    );
  }

  void onQRView(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      widget.onScanned(scanData.code.toString());
      Navigator.of(context).pop();
    });
  }
}
