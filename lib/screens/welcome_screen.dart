import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC6DABF), // Light green background
      appBar: AppBar(
        title: const Text('Bienvenido - Directorios FPSC'),
        backgroundColor: Color(0xFF114B5F), // Dark teal for the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // General padding
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Login button with Intermediate green color
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6B8F71), // Intermediate green
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Text style
                ),
                child: const Text('Iniciar Sesión'),
              ),

              const SizedBox(height: 16),

              // Register button with Light green color and darker shade
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8C9E87), // Darker green for contrast
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Text style
                ),
                child: const Text('Registrarse'),
              ),

              const SizedBox(height: 30), // Additional spacing for clean design

              // Optional additional text with dark teal color
              Text(
                '¡Comienza tu experiencia ahora!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF114B5F), // Dark teal text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
