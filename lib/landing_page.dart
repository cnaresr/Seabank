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
        child: SafeArea( // Tambahkan SafeArea agar konten tidak tertutup notch/status bar
          child: Column(
            children: [
              // 1. Grup Elemen Tengah (di dalam Expanded untuk memaksa ke tengah)
              Expanded(
                child: Center( // Center memastikan konten ini berada di tengah-tengah ruang yang tersedia
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Jaga agar column ini sekecil mungkin
                    children: [
                      // Logo dari aset gambar
                      _buildLogo(),
                      const SizedBox(height: 20),
                      
                      // Teks "Seabank" (disesuaikan agar lebih mirip contoh)
                      const Text(
                        "Seabank",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 26, // Ukuran sedikit diperbesar
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5, // Dikurangi agar lebih rapat
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 2. Grup Elemen Bawah (Disclaimer)
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0), // Margin kiri, kanan, bawah
                child: Column(
                  children: [
                    // Teks Disclaimer OJK, BI, dan LPS
                    const Text(
                      "Berizin dan diawasi oleh Otoritas Jasa Keuangan (OJK) dan Bank Indonesia (BI) serta merupakan bank peserta penjaminan Lembaga Penjamin Simpanan (LPS)",
                      textAlign: TextAlign.center, // Teks rata tengah
                      style: TextStyle(
                        color: Colors.black54, // Warna hitam sedikit pudar
                        fontSize: 12, // Ukuran font diperkecil
                        height: 1.4, // Jarak antar baris teks
                      ),
                    ),
                    const SizedBox(height: 8), // Sedikit jarak tambahan di bawahnya
                  ],
                ),
              ),
            ],
          ),
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