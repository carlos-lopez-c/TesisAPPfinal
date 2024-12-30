import 'package:flutter/material.dart';
import 'package:h_c_1/hc_ps/presentation/screens/PsicologiaTab.dart';

// import 'package:h_c_1/hc_tr/presentation/screens/TerapiaTab.dart';
// import 'package:h_c_1/home/presentation/screens/HomeScreen.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campo de correo electrónico
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese su correo.';
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Por favor, ingrese un correo válido.';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Campo de contraseña con el ícono de ojo
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
                labelStyle: const TextStyle(
                    color: Colors.lightBlue), // Etiqueta celeste
                prefixIcon: const Icon(Icons.lock,
                    color: Colors.lightBlue), // Ícono celeste
                // suffixIcon: IconButton(
                //   // icon: Icon(
                //   //   // _isObscure ? Icons.visibility : Icons.visibility_off,
                //   //   // color: Colors.grey,
                //   // ),
                //   onPressed: () {
                //     setState(() {
                //       _isObscure = !_isObscure; // Alterna visibilidad
                //     });
                //   },
                // ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PsicologiaTab(),
                          //para terapia >> Terapiatab
                        ),
                      );
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
