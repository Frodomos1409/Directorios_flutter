import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart'; // Asegúrate de la ruta correcta

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Directorios FPSC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false, // Establece WelcomeScreen como la pantalla inicial
    );
  }
}
