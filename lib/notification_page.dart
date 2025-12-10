import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Column(
          children: const [
            Icon(Icons.notifications_none, color: Colors.black, size: 28),
            Text(
              "NOTIFIKASI",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset('assets/images/seabank_logo.png', width: 30),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Tab Header (Notifikasi / Promo)
            Row(
              children: [
                const Text(
                  "Notifikasi",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  "Promo",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // List Notifikasi (Card style container)
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFFFE0B2,
                  ), // Background peach/orange muda
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: ListView(
                  children: [
                    _buildNotifItem(
                      Icons.verified_user,
                      Colors.blue,
                      "Akun SeaBank Terhubung",
                      "Kamu berhasil menghubungkan akun SeaBank kamu dengan ShopeePay pengguna pada 28 Okt 2025 19:30 (WIB).",
                      "28 Okt 2025, 19:30",
                    ),
                    const Divider(color: Colors.black26),
                    _buildNotifItem(
                      Icons.savings,
                      Colors.brown,
                      "Rekening Koran SeaBank!",
                      "e-Statement bulan September telah tersedia. Login ke akun SeaBank untuk melihat rincian.",
                      "1 Okt 2025, 18:30",
                    ),
                    const Divider(color: Colors.black26),
                    _buildNotifItem(
                      Icons.verified_user,
                      Colors.blue,
                      "Selamat datang di SeaBank!",
                      "Kamu telah berhasil mendaftarkan profil di SeaBank. Lanjutkan proses pembukaan rekening.",
                      "28 Sep 2025, 17:00",
                    ),

                    const SizedBox(height: 40),
                    // Hiasan bawah
                    Center(child: Icon(Icons.waves, color: Colors.black54)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotifItem(
    IconData icon,
    Color iconColor,
    String title,
    String body,
    String date,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(body, style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(fontSize: 10, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
