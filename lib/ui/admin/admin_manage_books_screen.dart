import 'package:flutter/material.dart';

class ManageBooks extends StatefulWidget {
  const ManageBooks({super.key});

  @override
  _ManageBooksState createState() => _ManageBooksState();
}

class _ManageBooksState extends State<ManageBooks> {
  final List<Map<String, String>> books = [
    {"title": "Book A", "author": "Author A", "stock": "10"},
    {"title": "Book B", "author": "Author B", "stock": "5"},
    {"title": "Book C", "author": "Author C", "stock": "2"},
  ];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();

  void _addBook() {  // Fungsi untuk menambahkan buku
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add New Book"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Book Title"),
              ),
              TextField(
                controller: _authorController,
                decoration: const InputDecoration(labelText: "Author"),
              ),
              TextField(
                controller: _stockController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Stock"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  books.add({
                    "title": _titleController.text,
                    "author": _authorController.text,
                    "stock": _stockController.text,
                  });
                });
                _titleController.clear();
                _authorController.clear();
                _stockController.clear();
                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menambahkan buku baru
  void _showDialogeditBook() {
    // Fungsi untuk edit buku.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Book"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Book Title"),
              ),
              TextField(
                controller: _authorController,
                decoration: const InputDecoration(labelText: "Author"),
              ),
              TextField(
                controller: _stockController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Stock"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  books.add({
                    "title": _titleController.text,
                    "author": _authorController.text,
                    "stock": _stockController.text,
                  });
                });
                _titleController.clear();
                _authorController.clear();
                _stockController.clear();
                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menampilkan dialog konfirmasi penghapusan
  void _showDialogDelete(BuildContext context, int index) {   // Mungkin bisa disesuaikan oleh BE Enginernya
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Book'), // Judul dialog
          content: Text('Are you sure you want to delete this book?'),
          actions: [
            // Tombol untuk membatalkan
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Membatalkan hapus buku
              }, 
              child: Text('Cancel')
            ),
            // Tombol untuk menghapus
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop();  // Untuk menutup kembali (utk sementara)
                // Tambahkan fungsi delete buku
                _deleteBook(index);
              },
            )
          ],
        );
      }
    );
  }

  // Ini misalkan masih menggunakan data dummy
  void _deleteBook(int index) {
    setState(() {
      books.removeAt(index);
    });
    print("Book successfully deleted");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Management',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF4A0D00),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        "${book["title"]} - ${book["author"]}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Stock: ${book["stock"]}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.brown),
                            onPressed: _showDialogeditBook
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.brown),
                            onPressed: () {    // Untuk mengggunakan fungsi
                              _showDialogDelete(context,index);
                            }
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addBook,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4A0D00),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text("Add Book", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}