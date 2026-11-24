import 'package:flutter/material.dart';

class PantallaNombres extends StatefulWidget {
  const PantallaNombres({super.key});

  @override
  State<PantallaNombres> createState() => _PantallaNombresState();
}

class _PantallaNombresState extends State<PantallaNombres> {
  // Clave del formulario y controlador del campo
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();

  void registrar() {
    // Validar que el formulario cumpla con las condiciones
    if (_formKey.currentState!.validate()) {
      // Mostrar el mensaje de éxito si la validación es correcta
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registro exitoso')),
      );
    }
  }

  @override
  void dispose() {
    // Limpiar el controlador cuando el widget se destruya
    _nombreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario de Nombres')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  // Requisito: El campo no debe estar vacío
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese su nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: registrar,
                child: const Text('REGISTRAR'), // Botón con el texto exacto
              ),
            ],
          ),
        ),
      ),
    );
  }
}