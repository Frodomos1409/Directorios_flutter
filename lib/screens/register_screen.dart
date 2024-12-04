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
        'name': nombre,           // Corregido 'nombre' a 'name'
        'email': email,
        'password': password,
        'institutionName': institution,  // Asegúrate de que sea 'institutionName' como en el backend
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
      backgroundColor: Color(0xFFC6DABF), // Fondo verde claro
      appBar: AppBar(
        title: const Text('Registro'),
        backgroundColor: Color(0xFF114B5F), // Color oscuro para la barra
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400), // Limitar el ancho
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Campo de nombre
                TextField(
                  controller: nombreController,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Color(0xFF114B5F)), // Color de la etiqueta
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF114B5F)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Campo de correo electrónico
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Color(0xFF114B5F)), // Color de la etiqueta
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF114B5F)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                
                // Campo de contraseña
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Color(0xFF114B5F)), // Color de la etiqueta
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF114B5F)),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                
                // Campo de institución
                TextField(
                  controller: institutionController,
                  decoration: InputDecoration(
                    labelText: 'Institución',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Color(0xFF114B5F)), // Color de la etiqueta
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF114B5F)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Campo de teléfono
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Teléfono',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Color(0xFF114B5F)), // Color de la etiqueta
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF114B5F)),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                
                // Campo de residencia
                TextField(
                  controller: residenceController,
                  decoration: InputDecoration(
                    labelText: 'Residencia',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Color(0xFF114B5F)), // Color de la etiqueta
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF114B5F)),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Botón de registro
                ElevatedButton(
                  onPressed: () => _register(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1A936F), // Verde intermedio
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Bordes redondeados
                    ),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Registrarse'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
