// ignore: file_names
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TakePictureWidgetState createState() => _TakePictureWidgetState();
}

class _TakePictureWidgetState extends State<CameraWidget> {
  File? _image;
  final ImagePicker _imagePicker = ImagePicker();
  bool _showCaptureButton =
      true; // Variable para controlar la visibilidad del botón "Capturar Foto"

  Future<void> _takePicture() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        _image = File(image.path);
        _showCaptureButton = false; // Ocultar el botón "Capturar Foto"
      }
    });
  }

  void _showImageDialog(File image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Imagen capturada'),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical, // Control de orientación vertical
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.file(image, width: 350, height: 350, fit: BoxFit.cover),
                const SizedBox(height: 10),
                const Text('¿Desea tomar otra foto?'),
              ],
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 109, 108, 108),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 109, 108, 108),
                foregroundColor: const Color.fromARGB(255, 223, 221, 221),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
                _takePicture(); // Tomar otra foto
              },
              child: const Text('Sí'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_showCaptureButton) // Mostrar el botón "Capturar Foto" solo si _showCaptureButton es true
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 109, 108, 108),
              foregroundColor: const Color.fromARGB(255, 223, 221, 221),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              minimumSize: const Size(140, 60), // Ancho mínimo y alto del botón
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
            onPressed: _takePicture,
            child: const Text('Capturar Foto'),
          ),
        if (_image != null)
          GestureDetector(
            onTap: () => _showImageDialog(_image!),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.file(
                _image!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
      ],
    );
  }
}
