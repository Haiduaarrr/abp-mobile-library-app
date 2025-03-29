import 'package:flutter/material.dart';

// File ini adalah halaman untuk pengguna melihat buku mana yang sedang dipinjam

class BorrowedBooksScreen extends StatelessWidget {
  //final List<String> borrowedBooks = [];

  // Di bawah ini misalkan ada beberapa buku (data dummy)
  final List<String> borrowedBooks = [
    "Clean Code - Robert C. Martin",
    "The Pragmatic Programmer - Andrew Hunt",
    "Introduction to Algorithms - Cormen",
    "Design Patterns - Erich Gamma",
    "Flutter for Beginners - Alessandro Biessek"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF4A0D00),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text("Borrowed Books",
          style: TextStyle(
            color: Colors.white,
          )
        ),
        centerTitle: true,

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Daftar buku yang dipinjam",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[900],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: borrowedBooks.isEmpty
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book, size: 80, color: Colors.brown[300]),
                    SizedBox(height: 16),
                    Text(
                      "Tidak ada buku yang dipinjam",
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),

                  ],
                )
                    : ListView.builder(
                  itemCount: borrowedBooks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,  // Memberikan efek bayang pada cardnya
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Icon(Icons.menu_book, color:Color(0xFF4A0D00)),
                        title: Text(
                          borrowedBooks[index],
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  },
                ),
              ),
              //SizedBox(height: 20),
              Center(
                child: 
                // ElevatedButton(
                //   onPressed: () => Navigator.pop(context),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Color(0xFF4A0D00),
                //     padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                //   child: Text("Back", style: TextStyle(fontSize: 18, color: Colors.white)),
                // ),
                Text('Jangan lupa untuk dikembalikan',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
