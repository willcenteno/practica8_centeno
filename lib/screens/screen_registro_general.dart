import 'package:flutter/material.dart';

class PantallaRegistroGeneral extends StatefulWidget {
  const PantallaRegistroGeneral({super.key});

  @override
  State<PantallaRegistroGeneral> createState() => _PantallaRegistroGeneralState();
}

class _PantallaRegistroGeneralState extends State<PantallaRegistroGeneral> {
  // Clave del formulario
  final _formKey = GlobalKey<FormState>();

  // Controladores para todos los campos
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _edadController = TextEditingController();
  final _dniController = TextEditingController();
  final _correoController = TextEditingController();
  final _contrasenaController = TextEditingController();

  void registrar() {
    // Valida que todos los campos cumplan sus respectivos requisitos
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registro general completado con éxito')),
      );
    }
  }

  @override
  void dispose() {
    // Liberamos todos los controladores
    _nombreController.dispose();
    _apellidoController.dispose();
    _edadController.dispose();
    _dniController.dispose();
    _correoController.dispose();
    _contrasenaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool ocultarContrasena = true;

    InputDecoration decoracionCampo({
      required String labelText,
      required String hintText,
      required IconData prefixIcon,
      Widget? suffixIcon,
    }) {
      return InputDecoration(
        labelText: labelText,
        hintText: hintText,
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
        prefixIcon: Icon(
          prefixIcon,
          color: const Color(0xFF64748B),
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
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
          borderSide: const BorderSide(color: Color(0xFFDC2626)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xFFDC2626),
            width: 2,
          ),
        ),
      );
    }

    const estiloTextoCampo = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xFF0F172A),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text(
          'Registro General',
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
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Container(
                padding: const EdgeInsets.all(24),
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
                            Icons.person_add_alt_1_outlined,
                            color: Color(0xFF4F46E5),
                            size: 32,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Completa tu registro',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F172A),
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Ingresa tus datos personales y credenciales para crear tu cuenta.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF64748B),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Sección 1: Datos personales
                      const Text(
                        'DATOS PERSONALES',
                        style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF64748B),
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // 1. Nombre
                      TextFormField(
                        controller: _nombreController,
                        textCapitalization: TextCapitalization.words,
                        autofillHints: const [AutofillHints.givenName],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        style: estiloTextoCampo,
                        decoration: decoracionCampo(
                          labelText: 'Nombre',
                          hintText: 'Ingresa tu nombre',
                          prefixIcon: Icons.person_outline_rounded,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'El nombre es obligatorio';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),

                      // 2. Apellido
                      TextFormField(
                        controller: _apellidoController,
                        textCapitalization: TextCapitalization.words,
                        autofillHints: const [AutofillHints.familyName],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        style: estiloTextoCampo,
                        decoration: decoracionCampo(
                          labelText: 'Apellido',
                          hintText: 'Ingresa tu apellido',
                          prefixIcon: Icons.badge_outlined,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'El apellido es obligatorio';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),

                      // 3. Edad
                      TextFormField(
                        controller: _edadController,
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        style: estiloTextoCampo,
                        decoration: decoracionCampo(
                          labelText: 'Edad',
                          hintText: 'Mayor o igual a 18',
                          prefixIcon: Icons.cake_outlined,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'La edad es obligatoria';
                          }
                          final edad = int.tryParse(value);
                          if (edad == null) {
                            return 'Solo debe aceptar números';
                          }
                          if (edad < 18) {
                            return 'La edad debe ser mayor o igual a 18';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),

                      // 4. DNI
                      TextFormField(
                        controller: _dniController,
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        style: estiloTextoCampo,
                        decoration: decoracionCampo(
                          labelText: 'Número de DNI',
                          hintText: '8 dígitos',
                          prefixIcon: Icons.credit_card_outlined,
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              !RegExp(r'^\d{8}$').hasMatch(value.trim())) {
                            return 'DNI incorrecto (deben ser 8 dígitos)';
                          }
                          return null;
                        },
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Divider(
                          height: 1,
                          color: Color(0xFFE2E8F0),
                        ),
                      ),

                      // Sección 2: Credenciales de acceso
                      const Text(
                        'CREDENCIALES DE ACCESO',
                        style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF64748B),
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // 5. Correo
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
                            textInputAction: TextInputAction.next,
                            style: estiloTextoCampo,
                            decoration: decoracionCampo(
                              labelText: 'Correo Electrónico',
                              hintText: 'ejemplo@correo.com',
                              prefixIcon: Icons.mail_outline_rounded,
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
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'El correo es obligatorio';
                              }
                              if (!value.contains('@')) {
                                return 'El correo debe contener @';
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 14),

                      // 6. Contraseña
                      StatefulBuilder(
                        builder: (context, setStateField) {
                          return TextFormField(
                            controller: _contrasenaController,
                            obscureText: ocultarContrasena,
                            autofillHints: const [AutofillHints.newPassword],
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => registrar(),
                            style: estiloTextoCampo,
                            decoration: decoracionCampo(
                              labelText: 'Contraseña',
                              hintText: 'Mínimo 6 caracteres',
                              prefixIcon: Icons.lock_outline_rounded,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setStateField(() {
                                    ocultarContrasena = !ocultarContrasena;
                                  });
                                },
                                tooltip: ocultarContrasena
                                    ? 'Mostrar contraseña'
                                    : 'Ocultar contraseña',
                                icon: Icon(
                                  ocultarContrasena
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: const Color(0xFF64748B),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return 'La contraseña debe tener al menos 6 caracteres';
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 28),

                      // Botón REGISTRAR
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