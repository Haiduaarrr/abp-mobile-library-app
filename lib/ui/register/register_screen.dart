import 'package:flutter/material.dart';
import 'package:library_app_abp/ui/login/login_screen.dart';


// File ini adalah halaman untuk orang yang baru mau menggunakan aplikasi
// dan ingin mendaftar.
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _adminCodeController = TextEditingController();

  String _selectedRole = "User"; // Default role
  bool _isAdmin = false; // Untuk menyembunyikan/memunculkan input kode admin

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Text(
                "REGISTER",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Serif',
                ),
              ),
              SizedBox(height: 32),

              // Nama Lengkap
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    hintText: "Full Name",
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.all(12),
                    prefixIcon: Icon(Icons.person)
                ),
              ),
              SizedBox(height: 16),

              // Nomor Telepon
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: "Phone Number",
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.all(12),
                    prefixIcon: Icon(Icons.phone)
                ),
              ),
              SizedBox(height: 16),

              // Username
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                    hintText: "Username",
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.all(12),
                    prefixIcon: Icon(Icons.account_circle)
                ),
              ),
              SizedBox(height: 16),

              // Password
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.all(12),
                    prefixIcon: Icon(Icons.lock)
                ),
              ),
              SizedBox(height: 16),

              // Confirm Password
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Confirm Password",
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.all(12),
                    prefixIcon: Icon(Icons.lock_outline_rounded)
                ),
              ),
              SizedBox(height: 16),

              // Role Selection (User / Admin)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text("User"),
                      value: "User",
                      groupValue: _selectedRole,
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value!;
                          _isAdmin = false; // LOGIC JAVA: Hide Admin Code Input
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text("Admin"),
                      value: "Admin",
                      groupValue: _selectedRole,
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value!;
                          _isAdmin = true; // LOGIC JAVA: Show Admin Code Input
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Admin Code (Hidden by Default)
              Visibility(
                visible: _isAdmin, // LOGIC JAVA
                child: TextField(
                  controller: _adminCodeController,
                  decoration: InputDecoration(
                      hintText: "Enter admin code",
                      border: UnderlineInputBorder(),
                      contentPadding: EdgeInsets.all(12),
                      prefixIcon:Icon(Icons.admin_panel_settings)
                  ),
                ),
              ),
              if (_isAdmin) SizedBox(height: 16),

              // Register Button
              SizedBox(
                width: 250,
                //width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4A0D00),
                    padding: EdgeInsets.all(16),
                  ),
                  onPressed: () {

                    // Akan ada logic notifikasi berhasil login
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen())
                    );

                  },
                  child: Text(
                    "REGISTER",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}