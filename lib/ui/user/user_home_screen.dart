import 'package:library_app_abp/ui/user/profile_screen.dart';
import 'package:library_app_abp/ui/user/borrowed_books_screen.dart';
import 'package:library_app_abp/ui/user/search_books_screen.dart';

import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF4A0D00),
          elevation: 0,
          iconTheme: IconThemeData(
              color: Colors.white
          ),
          title: Text('Home',
            style: TextStyle(
                color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Layout (User Info + Search Icon)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Haidar Sayyid Ramadhan',
                                style: TextStyle(
                                  color: Color(0xFF4A0D00),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Bandung, Indonesia",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          IconButton(   // button untuk mencari buku
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SearchBooksScreen())
                                );
                              },
                              icon: Icon(Icons.search, color: Colors.black)
                          )
                        ],
                      ),
                      SizedBox(height: 16),

                      // Banner Section
                      Stack(  // Supaya bisa terlihat di atas gambar, jadi pake stack
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage("assets/rak_buku.jpg"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Text(
                            "R A K    B U K U",
                            style: TextStyle(
                              fontSize: 38,
                              fontFamily: "serif",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      // Daftar Buku Title
                      Text(
                        "Daftar Buku",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A0D00)
                        ),
                      ),
                      SizedBox(height: 8),

                      // Daftar Buku menggunakan GridView
                      // Daftar Buku menggunakan ListView
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 8, // Ganti sesuai jumlah data real nanti
                        itemBuilder: (context, index) {
                          // Contoh data dummy
                          String judul = 'Judul Buku $index';
                          String penulis = 'Penulis $index';
                          int stok = 5 + index;

                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 2,
                            margin: EdgeInsets.symmetric(vertical: 6),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(judul, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 4),
                                  Text('Penulis: $penulis'),
                                  SizedBox(height: 4),
                                  Text('Stok: $stok'),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )
            ),

            // Bottom Navigation Bar
            Container(
              height: 56,
              color: Color(0xFF4A0D00),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.white),
                    onPressed: () {},
                    padding: EdgeInsets.all(12),
                  ),
                  IconButton(
                    icon: Icon(Icons.book, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BorrowedBooksScreen())
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.person, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileScreen())
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}