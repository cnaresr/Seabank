// File: lib/home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menggunakan Stack untuk Custom Bottom Navigation
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // --- KONTEN UTAMA (SCROLLABLE) ---
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                bottom: 100,
              ), // Padding agar tidak tertutup navbar
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 20),
                    _buildMainCard(),
                    const SizedBox(height: 25),
                    _buildMenuGrid(),
                    const SizedBox(height: 25),
                    _buildSectionTitle('E-Wallet Saya', showArrow: false),
                    const SizedBox(height: 10),
                    _buildEWalletSection(),
                    const SizedBox(height: 25),
                    _buildSectionTitle('Riwayat Transaksi'),
                    const SizedBox(height: 10),
                    _buildEmptyStateCard(
                      icon: Icons.receipt_long_rounded,
                      message:
                          'Kamu tidak memiliki transaksi dalam 30 hari terakhir.',
                      actionLabel: 'Top Up Sekarang >',
                      iconColor: Colors.blueAccent,
                    ),
                    const SizedBox(height: 25),
                    _buildSectionTitle('Transaksi Terakhir'),
                    const SizedBox(height: 10),
                    _buildEmptyStateCard(
                      icon: Icons.history,
                      message:
                          'Cek riwayat transaksi kamu di sini setelah kamu melakukan transaksi',
                      actionLabel: '',
                      iconColor: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),

            // --- BOTTOM NAVIGATION BAR ---
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildCustomBottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET BUILDER METHODS (Sama seperti sebelumnya) ---

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            shape: BoxShape.circle,
          ),
          child: const Text(
            "S",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined, size: 28),
            ),
            const SizedBox(width: 8),
            const CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMainCard() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFFFFAB40), Color(0xFFFFCC80)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "TOTAL SALDO",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
              ),
              Row(
                children: const [
                  Text(
                    "Tambah Saldo +  ",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  Text(
                    "Top Up +",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: const [
              Text(
                "8888 1234 5678 907",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.copy, color: Colors.white, size: 16),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Rp. 1.500.000",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
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

  Widget _buildMenuGrid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildMenuItem(Icons.download, "Transfer"),
        _buildMenuItem(Icons.account_balance_wallet, "E-Wallet"),
        _buildMenuItem(Icons.attach_money, "Setor Tunai"),
        _buildMenuItem(Icons.money_off, "Tarik Tunai"),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.orange, width: 1.5),
          ),
          child: Icon(icon, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, {bool showArrow = true}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        if (showArrow) const Icon(Icons.chevron_right, size: 20),
      ],
    );
  }

  Widget _buildEWalletSection() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE0B2),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.shopping_bag, color: Colors.orange),
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
                  const Icon(Icons.chevron_right, size: 16),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: const [
                  Icon(Icons.circle, color: Colors.purple, size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Hubungkan",
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.chevron_right, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyStateCard({
    required IconData icon,
    required String message,
    required String actionLabel,
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        children: [
          Icon(icon, size: 60, color: iconColor.withOpacity(0.5)),
          const SizedBox(height: 10),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          if (actionLabel.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              actionLabel,
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

  Widget _buildCustomBottomNavBar() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFFA726), Color(0xFFFFCC80)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.black87,
                  size: 30,
                ),
              ),
              const SizedBox(width: 40),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings_outlined,
                  color: Colors.black87,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 25,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB74D),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
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
                  size: 30,
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
