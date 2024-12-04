import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String userId;
  final String nombre;
  final String telefono;
  final String institucion;
  final String residencia;

  const EditProfileScreen({
    required this.userId,
    required this.nombre,
    required this.telefono,
    required this.institucion,
    required this.residencia,
    Key? key,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nombreController;
  late TextEditingController telefonoController;
  late TextEditingController institucionController;
  late TextEditingController residenciaController;

  @override
  void initState() {
    super.initState();
    nombreController = TextEditingController(text: widget.nombre);
    telefonoController = TextEditingController(text: widget.telefono);
    institucionController = TextEditingController(text: widget.institucion);
    residenciaController = TextEditingController(text: widget.residencia);
  }

  @override
  void dispose() {
    nombreController.dispose();
    telefonoController.dispose();
    institucionController.dispose();
    residenciaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        backgroundColor: Colors.teal, // Color personalizado para el AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                labelStyle: const TextStyle(color: Colors.teal),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: telefonoController,
              decoration: InputDecoration(
                labelText: 'Teléfono',
                labelStyle: const TextStyle(color: Colors.teal),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: institucionController,
              decoration: InputDecoration(
                labelText: 'Institución',
                labelStyle: const TextStyle(color: Colors.teal),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: residenciaController,
              decoration: InputDecoration(
                labelText: 'Residencia',
                labelStyle: const TextStyle(color: Colors.teal),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedData = {
                  'nombre': nombreController.text,
                  'telefono': telefonoController.text,
                  'institucion': institucionController.text,
                  'residencia': residenciaController.text, // Añadido residencia
                };
                Navigator.pop(context, updatedData);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Color del botón
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Bordes redondeados
                ),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
