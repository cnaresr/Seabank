import 'package:flutter/material.dart';
import 'loading_screen.dart'; // Pastikan file ini ada di folder yang sama

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    // Logic: Tunggu 3 detik, lalu pindah ke Loading Screen
    Future.delayed(const Duration(seconds: 3), () {
      // Menggunakan pushReplacement agar pengguna tidak bisa kembali ke halaman ini
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoadingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background Gradient Orange seperti di referensi
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF9F43), Color(0xFFFF8800)], // Warna Oranye
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo dari aset gambar
            _buildLogo(),
            const SizedBox(height: 20),
            // Teks SEA BANK
            const Text(
              "SEA BANK",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan logo dari gambar aset
  Widget _buildLogo() {
    return Image.asset(
      'assets/images/seabank_logo.png', // Pastikan path dan nama file benar
      width: 130, // Ukuran disesuaikan agar proporsional
      height: 130,
    );
  }
}
