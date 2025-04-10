import 'package:flutter/material.dart';
import 'package:library_app_abp/ui/admin/admin_return_screen.dart';
import 'package:library_app_abp/ui/admin/admin_manage_users_screen.dart';
import 'package:library_app_abp/ui/admin/admin_manage_books_screen.dart';
import 'package:library_app_abp/ui/admin/admin_request_screen.dart';
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
          "Admin Home",
          style: TextStyle(
              fontSize: 24,
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
              SizedBox(height:30),
              Text(
                "R A K  B U K U",
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: "Serif"
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Welcome, Admin!",
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.grey[500]
                ),
              ),
              SizedBox(height: 30),
              _buildButton(context, "Book Management",  Color(0xFF4A0D00), () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ManageBooks())  // Untuk menuju halaman admin manage book
                );
              }),
              _buildButton(context, "User Management",  Color(0xFF4A0D00), () {
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => ManageUsers())
                );
              }),
              _buildButton(context, "Book Borrowing",  Color(0xFF4A0D00), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminRequest())
                );
              }),
              _buildButton(context, "Book Return",  Color(0xFF4A0D00), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminReturnActivity())
                );
              }),
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
                      fontSize: 20,
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
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              //fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    );
  }
}
