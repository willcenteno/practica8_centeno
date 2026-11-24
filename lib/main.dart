import 'package:aplicativo1/pantallas/pantalla_contraseña.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PantallaContrasena(),
    );
  }
}