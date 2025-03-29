import 'package:flutter/material.dart';
import 'package:library_app_abp/ui/common/starting_page.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  // Fungsi ketika orang mau logout tapi ditanya dulu untuk meyakinkan
  // Memunculkan dialog atau seperti alert
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'), // Judul dialog
          content: Text('Apakah Anda yakin ingin logout?'), // Isi dialog
          actions: [
            // Tombol Tidak
            TextButton(
              child: Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
            // Tombol Ya
            TextButton(
              child: Text('Ya'),
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
          "R A K  B U K U",
          style: TextStyle(
              fontSize: 24,
              fontFamily: 'Serif',
              color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor:  Color(0xFF4A0D00),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                "Welcome, Admin!",
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.grey[500]
                ),
              ),
              SizedBox(height: 30),
              _buildButton(context, "Mengelola Buku",  Color(0xFF4A0D00), () {}),
              _buildButton(context, "Mengelola Pengguna",  Color(0xFF4A0D00), () {}),
              _buildButton(context, "Meminjam Buku",  Color(0xFF4A0D00), () {}),
              _buildButton(context, "Mengembalikan Buku",  Color(0xFF4A0D00), () {}),
              SizedBox(height: 30),

              // Tombol untuk logout pada home admin
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    _showDialog(context); // Memanggil fungsi dialog
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16,
                      //fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Color color, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: 250,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              //fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    );
  }
}
