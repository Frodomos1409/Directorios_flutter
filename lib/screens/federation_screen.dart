import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FederationScreen extends StatefulWidget {
  @override
  _FederationScreenState createState() => _FederationScreenState();
}

class _FederationScreenState extends State<FederationScreen> {
  List<dynamic> federations = [];

  @override
  void initState() {
    super.initState();
    fetchFederations();
  }

  // Función para obtener las federaciones desde la API
  Future<void> fetchFederations() async {
    final response = await http.get(Uri.parse('http://localhost:5000/api/federations'));

    if (response.statusCode == 200) {
      setState(() {
        federations = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load federations');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Federaciones'),
        backgroundColor: Color(0xFF114B5F), // Color de barra de app
      ),
      body: ListView.builder(
        itemCount: federations.length,
        itemBuilder: (context, index) {
          final federation = federations[index];
          return ListTile(
            title: Text(federation['name'], style: TextStyle(color: Color(0xFF114B5F))),
            subtitle: Text(federation['email']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FederationDetailScreen(federation: federation),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Pantalla de detalles de una federación
class FederationDetailScreen extends StatelessWidget {
  final Map<String, dynamic> federation;

  FederationDetailScreen({required this.federation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(federation['name']),
        backgroundColor: Color(0xFF114B5F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: ${federation['name']}', style: TextStyle(fontSize: 18, color: Color(0xFF114B5F))),
            SizedBox(height: 8),
            Text('Descripción: ${federation['description'] ?? 'No description available'}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Correo: ${federation['email']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Teléfono: ${federation['telefono']}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
