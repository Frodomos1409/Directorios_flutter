import 'package:flutter/material.dart';
import '../services/api_service.dart';

class RegisterInstitutionScreen extends StatelessWidget {
  final ApiService apiService = ApiService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController federationNameController = TextEditingController(); // Nuevo controlador para nombre de federación

  void _registerInstitution(BuildContext context) async {
    final name = nameController.text.trim();
    final address = addressController.text.trim();
    final lat = latController.text.trim();
    final lon = lonController.text.trim();
    final website = websiteController.text.trim();
    final federationName = federationNameController.text.trim(); // Usamos 'federationName'

    if (name.isEmpty || address.isEmpty || lat.isEmpty || lon.isEmpty || website.isEmpty || federationName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Todos los campos son obligatorios')),
      );
      return;
    }

    try {
      final institutionData = {
        'name': name,
        'address': address,
        'latitud': double.parse(lat),
        'longitud': double.parse(lon),
        'paginaWeb': website,
        'federationName': federationName, // Usamos 'federationName' en lugar de 'federationId'
      };

      final response = await apiService.createInstitution(institutionData);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Institución registrada: ${response['message']}')),
      );

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
      backgroundColor: Color(0xFFC6DABF),
      appBar: AppBar(
        title: const Text('Registrar Institución'),
        backgroundColor: Color(0xFF114B5F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: Column(
              children: [
                // Campo de nombre de institución
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre de la Institución',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Color(0xFF114B5F)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF114B5F)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Campo de dirección
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Dirección',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Color(0xFF114B5F)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF114B5F)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Campo de latitud
                TextField(
                  controller: latController,
                  decoration: InputDecoration(
                    labelText: 'Latitud',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Color(0xFF114B5F)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF114B5F)),
                    ),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 16),

                // Campo de longitud
                TextField(
                  controller: lonController,
                  decoration: InputDecoration(
                    labelText: 'Longitud',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Color(0xFF114B5F)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF114B5F)),
                    ),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 16),

                // Campo de página web
                TextField(
                  controller: websiteController,
                  decoration: InputDecoration(
                    labelText: 'Página Web',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Color(0xFF114B5F)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF114B5F)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Campo para nombre de la federación
                TextField(
                  controller: federationNameController,  // Ahora usamos este controlador
                  decoration: InputDecoration(
                    labelText: 'Nombre de la Federación',  // Nuevo campo para el nombre de la federación
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Color(0xFF114B5F)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF114B5F)),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Botón para registrar institución
                ElevatedButton(
                  onPressed: () => _registerInstitution(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1A936F),
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Registrar Institución'),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
