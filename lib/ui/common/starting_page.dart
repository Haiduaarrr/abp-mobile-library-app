import 'package:flutter/material.dart';
import 'package:library_app_abp/ui/login/login_screen.dart';
import 'package:library_app_abp/ui/register/register_screen.dart';

// File ini adalah halaman untuk pilih login atau registrasi (pendaftaran)

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(seconds: 3),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: child,
                    );
                  },
                  child: Text(
                    'R A K  B U K U',
                    style: TextStyle(
                      fontFamily: 'Serif',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(seconds: 3),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: child,
                    );
                  },
                  child: Image.asset(  // Untuk logo aplikasi
                    'assets/rak_buku.jpg',
                    width: 300,
                    height: 200,
                    fit: BoxFit.contain,

                  ),
                ),
                SizedBox(height: 32),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(seconds: 3),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: child,
                    );
                  },
                  child: ElevatedButton(  // Tombol untuk login
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),

                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[900],
                        foregroundColor: Colors.white,
                        fixedSize: Size(200, 30)
                    ),
                    child: Text('Login',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(seconds: 3),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: child,
                    );
                  },
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterScreen())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[900],
                          foregroundColor: Colors.white,
                          fixedSize: Size(200, 30)
                      ),
                      child: Text('Register',
                        style: TextStyle(
                            fontSize: 20
                        ),
                      )
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}