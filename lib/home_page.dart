import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variabel untuk mengontrol status visibilitas saldo
  bool _isBalanceVisible = true;

  @override
  Widget build(BuildContext context) {
    final Color mainOrange = const Color(0xFFFF9F43);
    final Color darkOrange = const Color(0xFFFF8800);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // KONTEN SCROLLABLE
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // HEADER
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _buildHeader(),
                    ),
                    const SizedBox(height: 25),

                    // SALDO CARD (Logika Sembunyikan Saldo ada di sini)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _buildSaldoCard(mainOrange, darkOrange),
                    ),
                    const SizedBox(height: 25),

                    // MENU ICON
                    _buildMenuIcons(context, mainOrange),

                    const SizedBox(height: 25),

                    // E-WALLET SECTION
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _buildEWalletSection(),
                    ),
                    const SizedBox(height: 25),

                    // RIWAYAT TRANSAKSI
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _buildSectionTitle('Riwayat Transaksi'),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _buildEmptyState(
                        imagePath: 'assets/images/icon_invoice_dollar.png',
                        text:
                            'Kamu tidak memiliki transaksi dalam 30 hari terakhir.',
                        linkText: 'Top Up Sekarang >',
                      ),
                    ),

                    const SizedBox(height: 25),

                    // TRANSAKSI TERAKHIR
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _buildSectionTitle('Transaksi Terakhir'),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: _buildEmptyState(
                        imagePath: 'assets/images/icon_invoice_history.png',
                        text:
                            'Cek riwayat transaksi kamu di sini setelah kamu melakukan transaksi',
                        linkText: '',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // BOTTOM NAVBAR
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

  // --- WIDGET KOMPONEN ---

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/seabank_logo.png', width: 50, height: 50),
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

  // --- BAGIAN YANG DIUBAH (SALDO CARD) ---
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
                  // Mengubah warna tanda tambah (+) menjadi Hitam
                  Text(
                    "Tambah Saldo ",
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                  Text(
                    "+   ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ), // Ubah ke Hitam
                  Text(
                    "Top Up ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "+",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ), // Ubah ke Hitam
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
              // Mengubah Ikon Copy menjadi Hitam
              Icon(Icons.copy, color: Colors.black, size: 16),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logika Tampilan Saldo
              Text(
                _isBalanceVisible
                    ? "Rp. 1.500.000"
                    : "Rp. ••••••••••", // Tampilkan angka atau bintang
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Tombol Mata (Interaktif)
              IconButton(
                onPressed: () {
                  // Mengubah status visibility saat ditekan
                  setState(() {
                    _isBalanceVisible = !_isBalanceVisible;
                  });
                },
                // Mengubah Icon dan Warna menjadi Hitam
                icon: Icon(
                  _isBalanceVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuIcons(BuildContext context, Color color) {
    final List<Map<String, dynamic>> menus = [
      {'icon': Icons.sync_alt, 'label': 'Transfer'},
      {'icon': Icons.account_balance_wallet_outlined, 'label': 'E-Wallet'},
      {'icon': Icons.payments_outlined, 'label': 'Setor Tunai'},
      {'icon': Icons.atm, 'label': 'Tarik Tunai'},
      {'icon': Icons.grid_view, 'label': 'Semua'},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        double availableWidth = constraints.maxWidth;
        double itemWidth = (availableWidth - 20) / 4;

        return SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: menus.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) {
              return Container(
                width: itemWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.orange.shade400,
                            Colors.deepOrange.shade400,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        menus[index]['icon'],
                        color: Colors.black87,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      menus[index]['label'],
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildEWalletSection() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFCC80),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
            child: const Text(
              "E-Wallet Saya",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          const Divider(color: Colors.black54, thickness: 0.5),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
            child: Row(
              children: [
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
                        Image.asset(
                          'assets/images/shopeepay.png',
                          width: 30,
                          height: 30,
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
                      children: [
                        Image.asset(
                          'assets/images/ovo.png',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 5),
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

  Widget _buildEmptyState({
    required String imagePath,
    required String text,
    required String linkText,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6F8),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black87, width: 1.2),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Image.asset(imagePath, fit: BoxFit.contain),
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

  Widget _buildCustomBottomNav(Color color1, Color color2) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 70,
          margin: const EdgeInsets.only(top: 20),
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
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.home, color: Colors.black87, size: 26),
              ),
              const SizedBox(width: 50),
              const Icon(
                Icons.settings_outlined,
                color: Colors.black87,
                size: 32,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 25,
          child: Column(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB74D),
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
