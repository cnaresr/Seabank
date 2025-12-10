import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart'; // Pastikan file ini ada di folder yang sama

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double _progressValue = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  // Fungsi untuk memulai animasi loading bar
  void _startLoading() {
    // Update progress bar setiap 50 milidetik
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        if (_progressValue >= 1.0) {
          _timer?.cancel();
          // Jika sudah penuh (100%), pindah ke HomePage
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          _progressValue += 0.02; // Kecepatan pengisian progress bar
        }
      });
    });
  }

  @override
  void dispose() {
    _timer
        ?.cancel(); // Hentikan timer saat widget dibuang untuk mencegah memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background Gradient Orange yang sama agar konsisten
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF9F43), Color(0xFFFF8800)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(), // Memberi ruang di atas
            // Logo dari aset gambar (sama dengan landing page)
            _buildLogo(),
            const SizedBox(height: 20),
            const Text(
              "SEA BANK",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),

            const Spacer(), // Memberi ruang di tengah
            // PROGRESS BAR (Loading Bar)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  // ClipRRect untuk membuat sudut progress bar membulat
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: _progressValue,
                      minHeight: 20, // Tebal bar
                      backgroundColor:
                          Colors.white, // Warna background bar (putih)
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.deepOrange,
                      ), // Warna isi (orange tua)
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "loading...",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(), // Memberi ruang di bawah
          ],
        ),
      ),
    );
  }

  // Widget logo yang konsisten dengan landing page
  Widget _buildLogo() {
    return Image.asset(
      'assets/images/seabank_logo.png',
      width: 130,
      height: 130,
    );
  }
}
