import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // Status Tab: false = Notifikasi, true = Promo
  bool isPromoTab = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        // Judul Header berubah sesuai Tab yang aktif
        title: Column(
          children: [
            const Icon(Icons.notifications_none, color: Colors.black, size: 28),
            Text(
              isPromoTab ? "PROMO" : "NOTIFIKASI", // Berubah dinamis
              style: const TextStyle(
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
            // Logo kecil di pojok kanan atas
            child: Image.asset('assets/images/logo_login.png', width: 35),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          children: [
            // --- TAB SELECTOR ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabItem("Notifikasi", !isPromoTab),
                _buildTabItem("Promo", isPromoTab),
              ],
            ),
            const SizedBox(height: 15),

            // --- KONTEN LIST (Card Style) ---
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE0B2), // Background Peach
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 1.2),
                ),
                // Menampilkan list berdasarkan tab yang dipilih
                child: ListView(
                  children: isPromoTab ? _buildPromoList() : _buildNotifList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk Tab (Garis bawah oranye saat aktif)
  Widget _buildTabItem(String title, bool isActive) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Logika pindah tab
          isPromoTab = (title == "Promo");
        });
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 8, left: 10, right: 10),
        decoration: BoxDecoration(
          border: isActive
              ? const Border(bottom: BorderSide(color: Colors.orange, width: 3))
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? Colors.orange : Colors.black54,
          ),
        ),
      ),
    );
  }

  // --- 1. DATA NOTIFIKASI ---
  List<Widget> _buildNotifList() {
    return [
      _buildItem(
        icon: Icons.verified_user_outlined,
        iconColor: Colors.blue,
        title: "Akun SeaBank Terhubung",
        body:
            "Kamu berhasil menghubungkan akun SeaBank kamu dengan ShopeePay pengguna pada 28 Okt 2025 19:30 (WIB) Hubungi 1500130 jika kamu tidak melakukan permintaan ini.",
        date: "28 Okt 2025, 19:30",
      ),
      const Divider(color: Colors.black26),
      _buildItem(
        icon: Icons.savings_outlined, // Ikon karung uang
        iconColor: Colors.brown,
        title: "Rekening Koran SeaBank!",
        body:
            "e-Statement bulan September telah tersedia. Login ke akun SeaBank untuk melihat rincian e-Statement kamu.",
        date: "1 Okt 2025, 18:30",
      ),
      const Divider(color: Colors.black26),
      _buildItem(
        icon: Icons.verified_user_outlined,
        iconColor: Colors.blue,
        title: "Selamat datang di SeaBank!",
        body:
            "Kamu telah berhasil mendaftarkan profil di SeaBank. Lanjutkan proses pembukaan rekening SeaBank sekarang!",
        date: "28 Sep 2025, 17:00",
      ),

      const SizedBox(height: 30),

      // --- ICON FOOTER (GANTI DENGAN GAMBAR BARU) ---
      Center(
        child: Image.asset(
          'assets/images/footer_icon.png', // Pastikan nama file ini sesuai
          width: 40, // Ukuran disesuaikan
          height: 40,
          color: Colors
              .black54, // Opsional: Memberikan warna abu-abu gelap agar menyatu
        ),
      ),
    ];
  }

  // --- 2. DATA PROMO ---
  List<Widget> _buildPromoList() {
    return [
      _buildItem(
        icon: Icons.local_offer, // Ikon Tag
        iconColor: Colors.black,
        title: "Bunga Andalan di Akhir Bulan 🌻",
        body: "Yuk, ambil bunga s.d. 8.25% p.a.-nya sekarang 👉",
        date: "28 Okt 2025, 19:30",
      ),
      const Divider(color: Colors.black26),
      _buildItem(
        icon: Icons.local_offer,
        iconColor: Colors.black,
        title: "Yuk, Buka Deposito Sekarang!",
        body:
            "Bunga SPESIAL s.d. 7% p.a. hadir KHUSUS PENGGUNA BARU DEPOSITO! Malam ini pk. 19:00 WIB, nyalain pengingatnya 👉",
        date: "27 Okt 2025, 18:00",
      ),
      const Divider(color: Colors.black26),
      _buildItem(
        icon: Icons.local_offer,
        iconColor: Colors.black,
        title: "Belum Pernah Buka Deposito Ya?",
        body:
            "Pas banget! Besok ada bunga s.d. 7% p.a. KHUSUS untuk PENGGUNA BARU DEPOSITO. Hanya di Deposito Flash Deals pk. 19:00 WIB~",
        date: "26 Okt 2025, 16:30",
      ),
      const Divider(color: Colors.black26),
      _buildItem(
        icon: Icons.local_offer,
        iconColor: Colors.black,
        title: "Tarik Tunai Makin Praktis 😉",
        body:
            "Pakai SeaBank bisa Tarik & Setor Tunai di Indomaret seluruh Indonesia! Cobain sekarang 👉",
        date: "25 Okt 2025, 14:00",
      ),

      const SizedBox(height: 30),

      // --- ICON FOOTER (GANTI DENGAN GAMBAR BARU) ---
      Center(
        child: Image.asset(
          'assets/images/footer_icon.png', // Menggunakan gambar yang sama
          width: 40,
          height: 40,
          color: Colors.black54,
        ),
      ),
    ];
  }

  // Template Item List
  Widget _buildItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String body,
    required String date,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Lingkaran Putih Icon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 15),
          // Teks
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
                Text(
                  body,
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
                const SizedBox(height: 8),
                Text(
                  date,
                  style: const TextStyle(fontSize: 11, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
