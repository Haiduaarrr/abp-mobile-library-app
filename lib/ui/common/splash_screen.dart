import 'package:flutter/material.dart';
import 'package:library_app_abp/ui/common/starting_page.dart';


// File ini adalah berisi animasi kalo mau buka aplikasi.
// Yang muncul adalah gambar rak buku yang warna coklat dan tulisan
// R A K  B U K U
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StartingPage()),
      );
    });

    return Scaffold(
      backgroundColor: Color(0xFF4A0D00), // Warna latar belakang Splash Screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/rak_buku.jpg', // Path gambar
              width: 300, // Atur ukuran gambar
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16), // Jarak antara gambar dan teks

            // Teks "R A K B U K U"
            const Text(
              'R A K  B U K U',
              style: TextStyle(
                fontFamily: 'Serif',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Warna teks
              ),
            ),
          ],
        ),
      ),
    );
  }
}
