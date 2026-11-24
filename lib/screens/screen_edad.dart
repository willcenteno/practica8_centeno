import 'package:flutter/material.dart';

class PantallaEdad extends StatefulWidget {
  const PantallaEdad({super.key});

  @override
  State<PantallaEdad> createState() => _PantallaEdadState();
}

class _PantallaEdadState extends State<PantallaEdad> {
  // Clave del formulario y controlador del campo
  final _formKey = GlobalKey<FormState>();
  final _edadController = TextEditingController();

  void registrar() {
    // Validar que el formulario cumpla con las condiciones
    if (_formKey.currentState!.validate()) {
      // Mostrar el mensaje de éxito si la validación es correcta
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Información correcta, registro exitoso')),
      );
    }
  }

  @override
  void dispose() {
    // Limpiar el controlador
    _edadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Edad')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _edadController,
                decoration: const InputDecoration(labelText: 'Edad'),
                // Abre el teclado numérico por defecto
                keyboardType: TextInputType.number,
                validator: (value) {
                  // Requisito 1: La edad es obligatoria
                  if (value == null || value.trim().isEmpty) {
                    return 'La edad es obligatoria';
                  }

                  // Requisito 2: Solo debe aceptar números
                  final edad = int.tryParse(value.trim());
                  if (edad == null) {
                    return 'Solo debe aceptar números';
                  }

                  // Requisito 3: La edad debe ser mayor o igual a 18
                  if (edad < 18) {
                    return 'La edad debe ser mayor o igual a 18';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: registrar,
                child: const Text('REGISTRAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}