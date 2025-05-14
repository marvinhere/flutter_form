import 'package:flutter/material.dart';
import 'form.dart';
void main() {
  runApp(const MainApp());
}
//Este es un cambios
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: EstudiantesForm(),
        ),
      ),
    );
  }
}
