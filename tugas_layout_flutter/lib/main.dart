import 'package:flutter/material.dart';

import 'profile_card.dart';

// Ketentuan 2.1: Fungsi main wajib menggunakan void main() => runApp(MyApp());
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // =========================================================================
    // Ketentuan 2.2: Digit terakhir NIM 20240801054 adalah 4 (GENAP)
    // Maka scaffoldBackgroundColor wajib: Colors.amber[100] (Kuning pastel)
    // =========================================================================
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Layout Flutter',
      theme: ThemeData(
        scaffoldBackgroundColor:
            Colors.amber[100], // Genap -> Colors.amber[100]
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black87,
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // =========================================================================
    // Ketentuan 2.3: Scaffold memposisikan ProfileCard tepat di tengah layar
    // Menggunakan widget Center
    // Skor Aktivitas dihitung dari (2 digit terakhir 54) + 50 = 104
    // =========================================================================
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profil Interaktif Mahasiswa",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: ProfileCard(
          nama: "Muhammad Geraldi Arisyi",
          nim: "20240801054",
          hobi: "Mobile App Development",
          skorAktivitas: 104,
        ),
      ),
    );
  }
}
