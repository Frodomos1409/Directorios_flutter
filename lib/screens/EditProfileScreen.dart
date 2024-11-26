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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: telefonoController,
              decoration: const InputDecoration(labelText: 'Teléfono'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: institucionController,
              decoration: const InputDecoration(labelText: 'Institución'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: residenciaController,
              decoration: const InputDecoration(labelText: 'Residencia'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'nombre': nombreController.text,
                  'telefono': telefonoController.text,
                  'institucion': institucionController.text,
                  'residencia': residenciaController.text,
                });
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
