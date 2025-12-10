import 'package:flutter/material.dart';
import 'landing_page.dart';

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
        scaffoldBackgroundColor: const Color(0xFFFFFAF5),
        fontFamily: 'Roboto',
      ),
      // --- LOGIKA RESPONSIF (LAPTOP vs HP) ---
      builder: (context, child) {
        final screenWidth = MediaQuery.of(context).size.width;

        // Jika layar lebar (Laptop/Web), batasi lebarnya jadi 400px
        if (screenWidth > 500) {
          return Scaffold(
            backgroundColor: Colors.grey[200], // Background luar
            body: Center(
              child: SizedBox(
                width: 400, // Lebar statis agar mirip HP
                child: child,
              ),
            ),
          );
        }

        // Jika di HP asli, tampilkan normal
        return child!;
      },
      home: const LandingPage(), // Mulai dari Landing Page
    );
  }
}
