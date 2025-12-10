import 'package:flutter/material.dart';
import 'landing_page.dart'; // PENTING: Aplikasi dimulai dari Landing Page

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
        scaffoldBackgroundColor: const Color(
          0xFFFFFAF5,
        ), // Warna background krem muda
        fontFamily: 'Roboto',
      ),

      // --- LOGIKA RESPONSIF (FRAME HP DI LAPTOP) ---
      builder: (context, child) {
        final screenWidth = MediaQuery.of(context).size.width;

        // Jika layar lebar (Laptop/Web > 500px), batasi lebarnya jadi 400px
        if (screenWidth > 500) {
          return Scaffold(
            backgroundColor: Colors.grey[200], // Background luar abu-abu
            body: Center(
              child: SizedBox(
                width: 400, // Lebar statis agar mirip HP
                child: child, // Halaman aplikasi
              ),
            ),
          );
        }

        // Jika di HP asli, tampilkan normal (Full Screen)
        return child!;
      },

      // ---------------------------------------------
      home: const LandingPage(), // Mulai alur dari Landing Page
    );
  }
}
