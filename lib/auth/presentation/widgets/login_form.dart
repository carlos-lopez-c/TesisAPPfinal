import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h_c_1/auth/presentation/providers/login_provider.dart';
import 'package:h_c_1/citas_medicTR/presentation/screens/ListaCitasTR.dart';
// import '/hc_ps/presentation/screens/PsicologiaTab.dart';
//import 'package:h_c_1/citas_medicPS/presentation/screens/ListaCitas.dart';

// import 'package:h_c_1/hc_tr/presentation/screens/TerapiaTab.dart';
// import 'package:h_c_1/home/presentation/screens/HomeScreen.dart';

class LoginForm extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(formularioProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campo de correo electrónico
            TextFormField(
              onChanged: ref.read(formularioProvider.notifier).onEmailChanged,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                errorStyle: const TextStyle(color: Colors.red),
                errorText: loginForm.isFormPosted
                    ? loginForm.email.errorMessage
                    : null,
                labelText: 'Correo Electrónico',
                labelStyle: const TextStyle(
                    color: Colors.lightBlue), // Etiqueta celeste
                hintText: 'ejemplo@correo.com',
                prefixIcon: const Icon(Icons.email,
                    color: Colors.lightBlue), // Ícono celeste
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlue), // Línea celeste
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.lightBlue,
                      width: 2.0), // Línea celeste más gruesa al enfocar
                ),
              ),
              style: const TextStyle(
                  color: Colors.black), // Texto ingresado de color negro
            ),

            const SizedBox(height: 16),

            // Campo de contraseña con el ícono de ojo
            TextFormField(
              onChanged:
                  ref.read(formularioProvider.notifier).onPasswordChanged,
              decoration: InputDecoration(
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                errorText: loginForm.isFormPosted
                    ? loginForm.password.errorMessage
                    : null,
                labelText: 'Contraseña',
                labelStyle: const TextStyle(
                    color: Colors.lightBlue), // Etiqueta celeste
                prefixIcon: const Icon(Icons.lock,
                    color: Colors.lightBlue), // Ícono celeste
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlue), // Línea celeste
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.lightBlue,
                      width: 2.0), // Línea celeste más gruesa al enfocar
                ),
              ),
              style: const TextStyle(
                  color: Colors.black), // Texto ingresado de color negro
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese su contraseña.';
                } else if (value.length < 6) {
                  return 'La contraseña debe tener al menos 6 caracteres.';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Botón de iniciar sesión con sombra
                Material(
                  elevation: 2, // Controla la intensidad de la sombra
                  borderRadius: BorderRadius.circular(30), // Bordes redondeados

                  child: OutlinedButton(
                    onPressed: () {
                      loginForm.isPosting
                          ? null
                          : ref
                              .read(formularioProvider.notifier)
                              .onFormSubmit();
                      // if (_formKey.currentState?.validate() ?? false) {
                      //   final email = _emailController.text.trim();
                      //   final password = _passwordController.text.trim();
                      //   widget.onLogin(email, password);
                      // }
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: const Color.fromARGB(255, 141, 183, 203),
                          width: 1.5), // Borde negro
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // Bordes redondeados
                      ),
                      foregroundColor:
                          const Color.fromARGB(255, 4, 71, 103), // Texto morado
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15), // Tamaño interno del botón
                    ),
                    child: const Text('Iniciar Sesión'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
