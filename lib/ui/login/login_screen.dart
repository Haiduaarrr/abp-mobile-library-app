import 'package:flutter/material.dart';
import 'package:library_app_abp/ui/register/register_screen.dart';
import 'package:library_app_abp/ui/user/user_home_screen.dart';


// File ini untuk login pengguna atau admin, tergantung usernam dan passwordnya nanti
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo
                  SizedBox(height: 35),
                  Image.asset(
                    'assets/rak_buku.jpg',
                    width: 300,
                    height: 200,
                  ),
                  const SizedBox(height: 16),

                  // Title
                  const Text(
                    'LOG IN',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Serif',
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Username Input
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        filled: true,
                        fillColor: Colors.white,
                        hintFadeDuration: Duration(milliseconds: 250),
                        border: UnderlineInputBorder(),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10), // Tambahkan padding agar icon lebih pas
                          child: Icon(Icons.person),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 15), // Menyesuaikan posisi teks agar sejajar
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Password Input
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        hintFadeDuration: Duration(milliseconds: 250),
                        border: UnderlineInputBorder(),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10), // Tambahkan padding agar icon lebih pas
                          child: Icon(Icons.lock),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 15), // Menyesuaikan posisi teks agar sejajar
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Pesan Error
                  if (_errorMessage != null)
                    Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  const SizedBox(height: 16),

                  // Remember Me
                  Center(
                    child: SizedBox(
                      width: 330,
                      child: Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _rememberMe = newValue ?? false;
                              });
                            },
                          ),

                          const Text('Remember Me'),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Login Button
                  SizedBox (
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika login di sini
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen())

                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[900],
                          foregroundColor: Colors.white
                      ),
                      child: const Text('LOGIN'),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Register Button
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman register
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterScreen())
                      );
                    },
                    child: const Text(
                      'Belum punya akun? Daftar di sini',
                      style: TextStyle(color: Colors.brown),
                    ),
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
