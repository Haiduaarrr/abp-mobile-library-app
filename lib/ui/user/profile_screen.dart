import 'package:library_app_abp/ui/common/starting_page.dart';
import 'package:flutter/material.dart';

// File ini adalah halaman pengguna untuk melihat siapa yang sedang login

class ProfileScreen extends StatelessWidget {

  // Fungsi untuk menampilkan Dialog
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'), // Judul dialog
          content: Text('Are you sure you want to quit?'), // Isi dialog
          actions: [
            // Tombol Tidak
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
            // Tombol Ya
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
                // Tambahkan logika logout di sini, misalnya:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => StartingPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF4A0D00),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Foto Profil
              CircleAvatar(
                radius: 60,

                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 16),

              // Nama Pengguna
              Text(
                "Haidar Sayyid Ramadhan",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),

              // Email Pengguna
              Text(
                "user@example.com",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 24),

              // Tombol Logout
              ElevatedButton(
                onPressed: () {
                  _showDialog(context); // Panggil fungsi dialog
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Logout", style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}