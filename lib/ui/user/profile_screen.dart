import 'package:library_app_abp/ui/common/starting_page.dart';
import 'package:flutter/material.dart';

// File ini adalah halaman pengguna untuk melihat siapa yang sedang login

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Foto Profil
              CircleAvatar(
                radius: 60,
                //backgroundImage: AssetImage("assets/user.png"), // Sesuaikan dengan path gambar profil
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StartingPage())
                  );
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

              // Tombol Back
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Back", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}