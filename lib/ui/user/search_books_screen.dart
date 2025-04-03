import 'package:flutter/material.dart';

// Ini adalah halaman pengguna untuk mencari buku yang tersedia

class SearchBooksScreen extends StatefulWidget {
  @override
  _SearchBooksScreenState createState() => _SearchBooksScreenState();
}

class _SearchBooksScreenState extends State<SearchBooksScreen> {
  TextEditingController _searchController = TextEditingController();

  // Di bawah ini misalkan ada beberapa buku (data dummy)
  final List<String> _allBooks = [
    "Flutter for Beginners",
    "Advanced Dart Programming",
    "Mobile UI/UX Design",
    "Machine Learning with Python",
    "Data Structures & Algorithms"
  ];
  List<String> _filteredBooks = [];
  bool _isLoading = false;

  void _searchBooks(String query) {
    setState(() => _isLoading = true);
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _filteredBooks = _allBooks
            .where((book) => book.toLowerCase().contains(query.toLowerCase()))
            .toList();
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Books", style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF4A0D00),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Jelajahi koleksi",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[900],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _searchController,
                  onChanged: _searchBooks,
                  decoration: InputDecoration(
                    hintText: "Search books",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : _filteredBooks.isEmpty && _searchController.text.isNotEmpty
                      ? Center(child: Text("No books found!"))
                      : ListView.builder(
                    itemCount: _filteredBooks.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(_filteredBooks[index]),
                          leading: Icon(Icons.book, color: Colors.brown[700]),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),

                // ElevatedButton(
                //   onPressed: () => Navigator.pop(context),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.brown[800],
                //     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                //   ),
                //   child: Text("Back", style: TextStyle(fontSize: 16, color: Colors.white)),
                // )
              ],
            ),
          )
      ),
    );
  }
}
