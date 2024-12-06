import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InstitutionScreen extends StatefulWidget {
  @override
  _InstitutionScreenState createState() => _InstitutionScreenState();
}

class _InstitutionScreenState extends State<InstitutionScreen> {
  List<dynamic> institutions = [];

  @override
  void initState() {
    super.initState();
    fetchInstitutions();
  }

  // Función para obtener las instituciones desde la API
  Future<void> fetchInstitutions() async {
    final response = await http.get(Uri.parse('http://localhost:5000/api/institutions'));

    if (response.statusCode == 200) {
      setState(() {
        institutions = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load institutions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instituciones'),
        backgroundColor: Color(0xFF114B5F), // Color de barra de app
      ),
      body: ListView.builder(
        itemCount: institutions.length,
        itemBuilder: (context, index) {
          final institution = institutions[index];
          return ListTile(
            title: Text(institution['name'], style: TextStyle(color: Color(0xFF114B5F))),
            subtitle: Text(institution['address'] ?? 'No address available'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InstitutionDetailScreen(institution: institution),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Pantalla de detalles de una institución
class InstitutionDetailScreen extends StatelessWidget {
  final Map<String, dynamic> institution;

  InstitutionDetailScreen({required this.institution});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(institution['name']),
        backgroundColor: Color(0xFF114B5F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: ${institution['name']}', style: TextStyle(fontSize: 18, color: Color(0xFF114B5F))),
            SizedBox(height: 8),
            Text('Dirección: ${institution['address'] ?? 'No address available'}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Página Web: ${institution['paginaWeb'] ?? 'No website available'}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Federación: ${institution['federation']['name']}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
