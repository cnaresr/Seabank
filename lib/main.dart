// File: lib/main.dart
import 'package:flutter/material.dart';
import 'home_page.dart'; // PENTING: Import file yang baru dibuat

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance App UI',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Background umum
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto', 
      ),
      home: const HomePage(), // Memanggil class dari file home_page.dart
    );
  }
}