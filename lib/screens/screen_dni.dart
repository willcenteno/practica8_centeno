import 'package:flutter/material.dart';

class PantallaDNI extends StatefulWidget {
  const PantallaDNI({super.key});

  @override
  State<PantallaDNI> createState() => _PantallaDNIState();
}

class _PantallaDNIState extends State<PantallaDNI> {
  // Clave del formulario y controlador del campo
  final _formKey = GlobalKey<FormState>();
  final _dniController = TextEditingController();

  void registrar() {
    // Validar que el formulario cumpla con las condiciones
    if (_formKey.currentState!.validate()) {
      // Mostrar el mensaje de éxito si la validación es correcta
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('DNI registrado correctamente')),
      );
    }
  }

  @override
  void dispose() {
    // Limpiar el controlador
    _dniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de DNI')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _dniController,
                decoration: const InputDecoration(labelText: 'Número de DNI'),
                // Teclado numérico para facilitar el ingreso
                keyboardType: TextInputType.number,
                validator: (value) {
                  // Validamos que no esté vacío, que tenga 8 caracteres y que sean solo números
                  // Usamos una expresión regular ^\d{8}$ que significa "exactamente 8 dígitos numéricos"
                  if (value == null ||
                      value.trim().isEmpty ||
                      !RegExp(r'^\d{8}$').hasMatch(value.trim())) {
                    return 'DNI incorrecto';
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