import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EstudiantesForm extends StatefulWidget {
  const EstudiantesForm({super.key});
  @override
  _EstudiantesFormState createState() => _EstudiantesFormState();
}

class _EstudiantesFormState extends State<EstudiantesForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _carneController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _carreraController = TextEditingController();
  
  String? _selectedFacultad;

  final List<String> facultades = ['Ingeniería', 'Medicina', 'Ciencias Sociales', 'Derecho'];

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final data = {
        'carne': _carneController.text,
        'nombre': _nombreController.text,
        'apellido': _apellidoController.text,
        'facultad': _selectedFacultad,
        'carrera': _carreraController.text,
        //'timestamp':DateTime.now().millisecondsSinceEpoch
      };

      final response = await http.post(
        Uri.parse('https://responsiveuvg-1653f-default-rtdb.firebaseio.com/estudiantes.json'),  // Reemplaza con tu URL de la API
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        // Si la respuesta es exitosa, puedes mostrar un mensaje o limpiar el formulario
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Estudiante creado con éxito')));
      } else {
        // Si hubo un error
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al crear el estudiante')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulario Estudiantes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _carneController,
                decoration: InputDecoration(labelText: 'Carné'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el carné';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _apellidoController,
                decoration: InputDecoration(labelText: 'Apellido'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el apellido';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedFacultad,
                decoration: InputDecoration(labelText: 'Facultad'),
                items: facultades.map((facultad) {
                  return DropdownMenuItem<String>(
                    value: facultad,
                    child: Text(facultad),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedFacultad = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor selecciona una facultad :)';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _carreraController,
                decoration: InputDecoration(labelText: 'Carrera'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la carrera';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Crear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
