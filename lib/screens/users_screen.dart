// lib/screens/users_screen.dart

import 'package:flutter/material.dart';
import '../services/api_service.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<Map<String, dynamic>> _users = [];
  bool _isLoading = true;
  String _errorMessage = '';

  // Método para cargar los usuarios
  Future<void> _fetchUsers() async {
    try {
      final response = await ApiService().getUsers();
      setState(() {
        _users = response;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _errorMessage = 'Error al cargar los usuarios: $error';
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUsers();  // Cargar los usuarios cuando se inicie la pantalla
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios Registrados'),
        backgroundColor: Color(0xFF114B5F),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())  // Cargando
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage, style: TextStyle(color: Colors.red, fontSize: 16)))
              : ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    final user = _users[index];
                    return ListTile(
                      leading: Icon(Icons.account_circle, size: 40),
                      title: Text(user['name'] ?? 'Nombre no disponible'),
                      subtitle: Text('Institución: ${user['institution']?['name'] ?? 'No asignada'}'),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        // Aquí podrías agregar más lógica, como navegar al perfil de usuario.
                      },
                    );
                  },
                ),
    );
  }
}