import 'package:flutter/material.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.userData}) : super(key: key);
  final Map<String, dynamic> userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC6DABF), // Fondo verde claro
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: Color(0xFF114B5F), // Barra de app en color oscuro
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
                    userId: userData['_id'], // Asegúrate de que este campo exista
                    nombre: userData['name'], // Usa 'name' aquí
                    telefono: userData['phone'] ?? '', // Asegúrate de que 'phone' esté disponible
                    institucion: userData['institution'] ?? 'Desconocido', // Si la institución no está, usa un valor predeterminado
                    residencia: userData['residence'] ?? 'Desconocido', // Si la residencia no está, usa un valor predeterminado
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Bienvenido, ${userData['name'] ?? 'Usuario'}', // Usa 'name' en lugar de 'nombre'
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF114B5F), // Color del texto
          ),
        ),
      ),
    );
  }
}