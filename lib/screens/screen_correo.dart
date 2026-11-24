import 'package:flutter/material.dart';

class PantallaCorreo extends StatefulWidget {
  const PantallaCorreo({super.key});

  @override
  State<PantallaCorreo> createState() => _PantallaCorreoState();
}

class _PantallaCorreoState extends State<PantallaCorreo> {
  // Clave del formulario y controlador del campo
  final _formKey = GlobalKey<FormState>();
  final _correoController = TextEditingController();

  void registrar() {
    // Validar que el formulario cumpla con las condiciones
    if (_formKey.currentState!.validate()) {
      // Mostrar el mensaje de éxito si la validación es correcta
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correo registrado correctamente')),
      );
    }
  }

  @override
  void dispose() {
    // Limpiar el controlador
    _correoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text(
          'Formulario de Correo',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0D0F172A),
                      blurRadius: 24,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEEF2FF),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(
                            Icons.mark_email_unread_outlined,
                            color: Color(0xFF4F46E5),
                            size: 32,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Registra tu correo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F172A),
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Ingresa tu dirección de correo electrónico para continuar con el registro.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF64748B),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 28),
                      ValueListenableBuilder<TextEditingValue>(
                        valueListenable: _correoController,
                        builder: (context, value, _) {
                          return TextFormField(
                            controller: _correoController,
                            keyboardType: TextInputType.emailAddress,
                            autofillHints: const [AutofillHints.email],
                            autocorrect: false,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => registrar(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF0F172A),
                            ),
                            decoration: InputDecoration(
                              labelText: 'Correo Electrónico',
                              hintText: 'ejemplo@correo.com',
                              labelStyle: const TextStyle(
                                color: Color(0xFF64748B),
                                fontWeight: FontWeight.w500,
                              ),
                              floatingLabelStyle: const TextStyle(
                                color: Color(0xFF4F46E5),
                                fontWeight: FontWeight.w600,
                              ),
                              hintStyle: const TextStyle(
                                color: Color(0xFF94A3B8),
                                fontWeight: FontWeight.w400,
                              ),
                              prefixIcon: const Icon(
                                Icons.mail_outline_rounded,
                                color: Color(0xFF64748B),
                              ),
                              suffixIcon: value.text.isNotEmpty
                                  ? IconButton(
                                      onPressed: _correoController.clear,
                                      tooltip: 'Limpiar correo',
                                      icon: const Icon(
                                        Icons.close_rounded,
                                        color: Color(0xFF64748B),
                                        size: 20,
                                      ),
                                    )
                                  : null,
                              filled: true,
                              fillColor: const Color(0xFFF8FAFC),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Color(0xFFCBD5E1),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Color(0xFFCBD5E1),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Color(0xFF4F46E5),
                                  width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Color(0xFFDC2626),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Color(0xFFDC2626),
                                  width: 2,
                                ),
                              ),
                            ),
                            validator: (value) {
                              // Requisito: Obligatorio y debe contener '@'
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Ingrese un correo válido';
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      const Row(
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            size: 16,
                            color: Color(0xFF64748B),
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              'Asegúrate de incluir el símbolo @ en tu dirección.',
                              style: TextStyle(
                                fontSize: 12.5,
                                color: Color(0xFF64748B),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 26),
                      SizedBox(
                        height: 52,
                        child: ElevatedButton(
                          onPressed: registrar,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4F46E5),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.8,
                            ),
                          ),
                          child: const Text('REGISTRAR'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}