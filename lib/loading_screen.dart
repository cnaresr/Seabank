import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart'; // PENTING: Import halaman Login (tujuan setelah loading)

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

  void _startLoading() {
    // Timer berjalan setiap 50 milidetik untuk mengisi bar
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        if (_progressValue >= 1.0) {
          _timer?.cancel();

          // JIKA PENUH: Pindah ke Halaman Login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          _progressValue += 0.02; // Kecepatan pengisian
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Hentikan timer jika widget ditutup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background Gradient Orange
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
            const Spacer(), // Dorong konten ke tengah
            // Logo
            Image.asset(
              'assets/images/seabank_logo.png', // Pastikan nama file benar
              width: 130,
              height: 130,
            ),
            const SizedBox(height: 20),

            // Teks Brand
            const Text(
              "SEA BANK",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),

            const Spacer(), // Memberi jarak fleksibel
            // PROGRESS BAR (Loading Bar)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: _progressValue,
                      minHeight: 20, // Ketebalan bar
                      backgroundColor: Colors.white, // Warna track (putih)
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
}
