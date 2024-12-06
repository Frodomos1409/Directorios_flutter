import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'register_federation_screen.dart';  
import 'register_institution_screen.dart';
import 'federation_screen.dart';
import 'institution_screen.dart';
import 'users_screen.dart';  // Importa la pantalla de usuarios

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
                    userId: userData['_id'],
                    nombre: userData['name'],
                    telefono: userData['phone'] ?? '',
                    institucion: userData['institution'] ?? 'Desconocido',
                    residencia: userData['residence'] ?? 'Desconocido',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Bienvenido, ${userData['name'] ?? 'Usuario'}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF114B5F),
              ),
            ),
          ),
          SizedBox(height: 20), // Espacio entre el texto y el primer botón
          
          // Botón para registrar federación
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterFederationScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF114B5F),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
            child: Text(
              'Registrar Federación',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          SizedBox(height: 20),

          // Botón para registrar institución
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterInstitutionScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1A936F),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
            child: Text(
              'Registrar Institución',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          SizedBox(height: 20),

          // Botón para ver las federaciones registradas
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FederationScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1A936F),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
            child: Text(
              'Ver Federaciones',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          SizedBox(height: 20),

          // Botón para ver las instituciones registradas
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InstitutionScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF114B5F),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
            child: Text(
              'Ver Instituciones',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          SizedBox(height: 20),

          // Botón para ver los usuarios registrados
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UsersScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1A936F),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
            child: Text(
              'Ver Usuarios Registrados',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
