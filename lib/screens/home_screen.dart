import 'package:flutter/material.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/profile_placeholder.png'),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    userId: '12345', // Proporciona el userId necesario
                    nombre: 'Brillo Antelo Roncales',
                    telefono: '123456789',
                    institucion: 'FPSC',
                    residencia: 'Santa Cruz, Bolivia',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Bienvenido Brillo Antelo Roncales'),
      ),
    );
  }
}
