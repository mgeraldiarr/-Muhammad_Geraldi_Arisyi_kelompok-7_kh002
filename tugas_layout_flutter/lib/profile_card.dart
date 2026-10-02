import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  // ===========================================================================
  // 1. KONSTRUKTOR & PROPERTI (WAJIB 4 PARAMETER)
  // ===========================================================================
  final String nama;
  final String nim;
  final String hobi;
  final int skorAktivitas;

  const ProfileCard({
    super.key,
    required this.nama,
    required this.nim,
    required this.hobi,
    required this.skorAktivitas,
  });

  @override
  Widget build(BuildContext context) {
    // ===========================================================================
    // NILAI ATRIBUT HASIL PERHITUNGAN NIM (20240801054):
    // - Lebar Kartu    : 320.0 + (5 * 5)   = 345.0
    // - Border Radius  : 12.0  + (4 * 1.5) = 18.0
    // - Ukuran Logo    : 60.0  + (4 * 2)   = 68.0
    // - Jarak Pemisah  : 15.0  + 4         = 19.0
    // ===========================================================================
    const double cardWidth = 345.0;
    const double cardBorderRadius = 18.0;
    const double logoSize = 68.0;
    const double spacingWidth = 19.0;

    return Container(
      // ROOT KARTU
      width: cardWidth,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(cardBorderRadius),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26, // Hitam transparan
            blurRadius: 10.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ===================================================================
          // BAGIAN HEADER KARTU (HORIZONTAL - ROW)
          // ===================================================================
          Row(
            children: [
              // Sisi Kiri: FlutterLogo dengan bingkai lengkung
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(cardBorderRadius),
                ),
                child: const FlutterLogo(size: logoSize),
              ),

              // Jarak Pemisah Horizontal (SizedBox)
              const SizedBox(width: spacingWidth),

              // Sisi Kanan: Column dengan CrossAxisAlignment.start
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Kartu Praktikan",
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      nama,
                      style: const TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // ===================================================================
          // PEMISAH (DIVIDER)
          // ===================================================================
          const SizedBox(height: 14.0),
          const Divider(thickness: 1.5),
          const SizedBox(height: 10.0),

          // ===================================================================
          // BAGIAN DETAIL IDENTITAS (VERTIKAL - COLUMN)
          // ===================================================================
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailItem("NIM", nim),
              const SizedBox(height: 8.0),
              _buildDetailItem("Hobi", hobi),
              const SizedBox(height: 8.0),
              _buildDetailItem("Skor Aktivitas", skorAktivitas.toString()),
            ],
          ),
        ],
      ),
    );
  }

  // Helper widget untuk baris identitas rapi
  Widget _buildDetailItem(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 115.0,
          child: Text(
            label,
            style: const TextStyle(fontSize: 14.0, color: Colors.black54),
          ),
        ),
        const Text(": "),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600, // Tebal / w600 sesuai modul
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
