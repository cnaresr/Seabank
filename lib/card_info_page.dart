import 'package:flutter/material.dart';

class CardInfoPage extends StatelessWidget {
  const CardInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // --- 1. HEADER (Background Putih) ---
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/seabank_logo.png', width: 40),
                    const Icon(Icons.notifications_none_outlined, size: 30),
                  ],
                ),
              ),

              // --- 2. CONTAINER ORANYE BESAR (Membungkus Judul & Kartu) ---
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFAB40), // Warna Oranye Utama
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      30,
                    ), // Lengkungan tumpul bawah kiri
                    bottomRight: Radius.circular(
                      30,
                    ), // Lengkungan tumpul bawah kanan
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    // JUDUL
                    const Text(
                      "INFORMASI KARTU",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // KARTU ABU-ABU (Posisi di dalam Container Oranye)
                    Container(
                      margin: const EdgeInsets.fromLTRB(
                        20,
                        0,
                        20,
                        30,
                      ), // Margin bawah agar oren terlihat
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E0E0), // Abu-abu
                        borderRadius: BorderRadius.circular(
                          20,
                        ), // Sudut kartu abu-abu
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Icon Wallet (Kotak Orange Kecil)
                          Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFCC80),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                            child: const Icon(
                              Icons.account_balance_wallet_outlined,
                              size: 32,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 20),

                          // Text Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Nama Pengguna",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "**** **** **** 907",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'monospace',
                                    letterSpacing: 1,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  "Kode Referral :",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                // Bar Abu-abu Gelap
                                Container(
                                  height: 18,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade600,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // --- 3. JUDUL RIWAYAT ---
              const Text(
                "RIWAYAT TRANSAKSI",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              const SizedBox(height: 20),

              // --- 4. GRID RIWAYAT ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // KOLOM KIRI
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            _buildHistoryItem(
                              "Kamu tidak memiliki transaksi dalam 30 hari terakhir.",
                            ),
                            const SizedBox(height: 12),
                            _buildHistoryItem(
                              "Kamu tidak memiliki transaksi dalam 3 bulan terakhir.",
                            ),
                            const SizedBox(height: 12),
                            _buildHistoryItem(
                              "Kamu tidak memiliki transaksi dalam 1 tahun terakhir.",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      // KOLOM KANAN
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFCC80),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black, width: 1.5),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(12),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.black54,
                                    width: 0.5,
                                  ),
                                ),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.search,
                                      size: 16,
                                      color: Colors.black54,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "Cari Transaksi",
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // --- 5. TOMBOL BACK ---
              Container(
                width: 140,
                height: 45,
                margin: const EdgeInsets.only(left: 20),
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEF6C00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Back",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryItem(String text) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE0B2).withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 35,
            decoration: BoxDecoration(
              color: const Color(0xFFFFAB40),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: const Icon(Icons.show_chart, size: 24, color: Colors.black),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
