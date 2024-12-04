import 'package:flutter/material.dart';
import 'package:directorios_fpsc/screens/EditProfileScreen.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;
  final String nombre;
  final String telefono;
  final String institucion;
  final String residencia;

  const ProfileScreen({
    required this.userId,
    required this.nombre,
    required this.telefono,
    required this.institucion,
    required this.residencia,
    Key? key,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String userId;
  late String nombre;
  late String telefono;
  late String institucion;
  late String residencia;

  @override
  void initState() {
    super.initState();
    userId = widget.userId;
    nombre = widget.nombre;
    telefono = widget.telefono;
    institucion = widget.institucion;
    residencia = widget.residencia;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC6DABF), // Fondo verde claro
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Color(0xFF114B5F), // Barra de app en color oscuro
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile_placeholder.png'),
            ),
            const SizedBox(height: 20),
            Text(
              nombre,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF114B5F)), // Color del texto
            ),
            const SizedBox(height: 10),
            Text(
              telefono,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              institucion,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              residencia,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final updatedData = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      userId: userId,
                      nombre: nombre,
                      telefono: telefono,
                      institucion: institucion,
                      residencia: residencia,
                    ),
                  ),
                );

                if (updatedData != null && updatedData is Map<String, String>) {
                  setState(() {
                    nombre = updatedData['nombre'] ?? nombre;
                    telefono = updatedData['telefono'] ?? telefono;
                    institucion = updatedData['institucion'] ?? institucion;
                    residencia = updatedData['residencia'] ?? residencia;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A936F), // Color del botón
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Bordes redondeados
                ),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
