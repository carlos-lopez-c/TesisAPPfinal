import 'package:flutter/material.dart';
import 'auth/presentation/screens/login_screen.dart';
import 'auth/presentation/screens/forward_password.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Historias Clínicas',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
      },
    );
  }
}
