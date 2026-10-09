import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'widgets/app_button.dart';

void main() => runApp(const MyApp());

// =============================================================================
// Perhitungan ukuran berdasarkan NIM 20240801054
// Digit terakhir NIM (d) = 4
//
// | Properti           | Rumus      | Perhitungan  | Hasil |
// | ------------------ | ---------- | ------------ | ----- |
// | Padding card       | 16 + d     | 16 + 4       | 20 px |
// | Rounded card       | 8 + d      | 8 + 4        | 12 px |
// | Tinggi tombol      | 40 + d     | 40 + 4       | 44 px |
// | Rounded tombol     | 4 + d      | 4 + 4        | 8 px  |
// | Ukuran avatar      | 40 + 2d    | 40 + (2 × 4) | 48 px |
// | Jarak nama dan NIM | 8 + d      | 8 + 4        | 12 px |
// =============================================================================
const double d = 4;

const double cardPadding = 16 + d; // 20
const double cardRadius = 8 + d; // 12
const double buttonHeight = 40 + d; // 44
const double buttonRadius = 4 + d; // 8
const double avatarSize = 40 + 2 * d; // 48
const double namaNimSpacing = 8 + d; // 12

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Theme diterapkan melalui MaterialApp (lihat theme/app_theme.dart)
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Profile Card',
      theme: AppTheme.light,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY PROFILE'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cardRadius),
            ),
            child: Padding(
              padding: const EdgeInsets.all(cardPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 1. Ikon avatar (diameter 48)
                  const CircleAvatar(
                    radius: avatarSize / 2,
                    child: Icon(Icons.person),
                  ),
                  const SizedBox(height: 16),

                  // 2. Nama lengkap
                  const Text('Muhammad Geraldi Arisyi'),
                  const SizedBox(height: namaNimSpacing),

                  // 3. NIM
                  const Text('20240801054'),
                  const SizedBox(height: 8),

                  // 4. Program studi
                  const Text('Teknik Informatika'),
                  const SizedBox(height: 16),

                  // 5. Deskripsi singkat
                  const Text(
                    'Saya Mahasiswa Universitas Esa Unggul, Fakultas Ilmu Komputer',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  // 6. Tombol GitHub (Reusable Component + Intent)
                  const AppButton(
                    label: 'Kunjungi GitHub Saya',
                    icon: Icons.code,
                    url: 'https://github.com/mgeraldiarr',
                    height: buttonHeight,
                    borderRadius: buttonRadius,
                  ),
                  const SizedBox(height: 12),

                  // Pemanggilan ulang AppButton tanpa menulis ulang kode tombol
                  const AppButton(
                    label: 'Kunjungi Website',
                    icon: Icons.web,
                    url: 'https://www.esaunggul.ac.id/',
                    height: buttonHeight,
                    borderRadius: buttonRadius,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
