import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Warna Oranye yang dominan di gambar
    final Color mainOrange = const Color(0xFFFF9F43);
    final Color darkOrange = const Color(0xFFFF8800);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // --- KONTEN SCROLLABLE ---
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                20,
                20,
                20,
                120,
              ), // Bottom padding besar agar tidak tertutup nav bar
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 25),
                  _buildSaldoCard(mainOrange, darkOrange),
                  const SizedBox(height: 25),
                  _buildMenuIcons(mainOrange),
                  const SizedBox(height: 25),
                  _buildEWalletSection(mainOrange),
                  const SizedBox(height: 25),
                  _buildSectionTitle('Riwayat Transaksi'),
                  const SizedBox(height: 8),
                  _buildEmptyState(
                    icon: Icons.receipt_long,
                    text:
                        'Kamu tidak memiliki transaksi dalam 30 hari terakhir.',
                    linkText: 'Top Up Sekarang >',
                    colorIcon: Colors.blueAccent,
                  ),
                  const SizedBox(height: 25),
                  _buildSectionTitle('Transaksi Terakhir'),
                  const SizedBox(height: 8),
                  _buildEmptyState(
                    icon: Icons.history,
                    text:
                        'Cek riwayat transaksi kamu di sini setelah kamu melakukan transaksi',
                    linkText: '', // Tidak ada link
                    colorIcon: Colors.grey,
                  ),
                ],
              ),
            ),

            // --- BOTTOM NAVIGATION BAR CUSTOM ---
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildCustomBottomNav(mainOrange, darkOrange),
            ),
          ],
        ),
      ),
    );
  }

  // 1. Header (Logo & Profil)
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo S
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black87, width: 1.5),
          ),
          child: const Center(
            child: Text(
              "S",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // Notifikasi & Profil
        Row(
          children: [
            const Icon(Icons.notifications_none_outlined, size: 30),
            const SizedBox(width: 15),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1.5),
              ),
              child: const Icon(Icons.person_outline, size: 28),
            ),
          ],
        ),
      ],
    );
  }

  // 2. Kartu Saldo (Gradient Orange)
  Widget _buildSaldoCard(Color color1, Color color2) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: color1.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "TOTAL SALDO",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
              ),
              Row(
                children: const [
                  Text(
                    "Tambah Saldo +   ",
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                  Text(
                    "Top Up +",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: const [
              Text(
                "8888 1234 5678 907",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.copy, color: Colors.white, size: 16),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Rp. 1.500.000",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.visibility_off_outlined, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  // 3. Menu Grid Icons (Circle Orange + Black Icon)
  Widget _buildMenuIcons(Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _menuItem(Icons.sync_alt, "Transfer", color), // Ikon panah bolak balik
        _menuItem(Icons.account_balance_wallet_outlined, "E-Wallet", color),
        _menuItem(Icons.payments_outlined, "Setor Tunai", color),
        _menuItem(Icons.save_alt, "Tarik Tunai", color),
      ],
    );
  }

  Widget _menuItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color, // Background orange pekat
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black12), // Sedikit border tipis
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.black87, size: 28), // Icon hitam
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // 4. E-Wallet Section (Mirip Tiket/Card)
  Widget _buildEWalletSection(Color color) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFCC80), // Orange muda/pastel background
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header "E-Wallet Saya" di dalam kotak
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
            child: const Text(
              "E-Wallet Saya",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          const Divider(
            color: Colors.black54,
            thickness: 0.5,
          ), // Garis pemisah hitam tipis

          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
            child: Row(
              children: [
                // ShopeePay Card
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.shopping_bag,
                          color: Colors.orange,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "D****5",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            Text("Rp 1.234", style: TextStyle(fontSize: 10)),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.chevron_right, size: 18),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // OVO Card
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.circle, color: Colors.purple, size: 18),
                        SizedBox(width: 5),
                        Text(
                          "Hubungkan",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.chevron_right, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 5. Section Title
  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(Icons.chevron_right, size: 20),
      ],
    );
  }

  // 6. Empty State (Kotak putih dengan border hitam)
  Widget _buildEmptyState({
    required IconData icon,
    required String text,
    required String linkText,
    required Color colorIcon,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6F8), // Putih keabuan
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black87,
          width: 1.2,
        ), // Border HITAM sesuai gambar
      ),
      child: Column(
        children: [
          // Ilustrasi sederhana menggunakan Icon + Stack
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Icon(icon, size: 50, color: Colors.blue.shade200),
              if (icon == Icons.receipt_long)
                const Icon(
                  Icons.monetization_on,
                  color: Colors.orange,
                  size: 24,
                ),
              if (icon == Icons.history)
                const Icon(Icons.history, color: Colors.orange, size: 24),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          if (linkText.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              linkText,
              style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }

  // 7. Custom Bottom Navbar (Blurry Gradient + Floating QRIS)
  Widget _buildCustomBottomNav(Color color1, Color color2) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        // Background Bar
        Container(
          height: 70,
          margin: const EdgeInsets.only(
            top: 20,
          ), // Memberi ruang untuk tombol QRIS yg nongol
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color1.withOpacity(0.9), color2.withOpacity(0.9)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home Button (Lingkaran Putih)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.home, color: Colors.black87, size: 26),
              ),
              const SizedBox(width: 50), // Jarak untuk QRIS tengah
              // Settings Button (Icon saja)
              const Icon(
                Icons.settings_outlined,
                color: Colors.black87,
                size: 32,
              ),
            ],
          ),
        ),

        // QRIS Floating Button
        Positioned(
          bottom: 25, // Membuatnya melayang naik
          child: Column(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB74D), // Warna orange lebih terang
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.qr_code_scanner,
                  size: 32,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "QRIS",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
