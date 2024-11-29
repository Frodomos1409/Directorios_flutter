import 'package:flutter/material.dart';
import '../services/api_service.dart';

class RegisterScreen extends StatelessWidget {
  final ApiService apiService = ApiService();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController institutionController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController residenceController = TextEditingController();

  void _register(BuildContext context) async {
    final nombre = nombreController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final institution = institutionController.text.trim();
    final phone = phoneController.text.trim();
    final residence = residenceController.text.trim();

    if (nombre.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        institution.isEmpty ||
        phone.isEmpty ||
        residence.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Todos los campos son obligatorios')),
      );
      return;
    }

    try {
      final userData = {
        'nombre': nombre,
        'email': email,
        'password': password,
        'institution': institution,
        'phone': phone,
        'residence': residence,
      };

      final response = await apiService.createUser(userData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuario registrado: ${response['message']}')),
      );

      // Redirigir a la pantalla de bienvenida
      Navigator.pushNamed(context, '/welcome');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Correo Electrónico'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: institutionController,
              decoration: const InputDecoration(labelText: 'Institución'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Teléfono'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: residenceController,
              decoration: const InputDecoration(labelText: 'Residencia'),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () => _register(context),
                child: const Text('Registrarse'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
