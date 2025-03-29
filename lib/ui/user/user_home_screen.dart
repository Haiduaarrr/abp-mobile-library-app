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
          title: Text('Home',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
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
                              // border: Border.all(
                              //   color: Colors.brown,
                              //   width: 4
                              // ),
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A0D00)
                        ),
                      ),
                      SizedBox(height: 8),

                      // Daftar Buku menggunakan GridView
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,   // Untuk membuat jadi 2 kolom
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.7 // Mengatur proporsi kartu buku
                        ),
                        itemCount: 8,  // Bisa diubah-ubah, misalkan untuk banyaknya buku
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                      image: DecorationImage(
                                        image: AssetImage("assets/book1.jpg"), // Ganti dengan path gambar buku
                                        fit: BoxFit.contain,
                                      ),

                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Judul Buku $index",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
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