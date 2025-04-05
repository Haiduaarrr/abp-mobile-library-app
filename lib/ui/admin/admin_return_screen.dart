import 'package:flutter/material.dart';
// Mengimpor library Material untuk membangun UI Flutter

// Kelas utama yang merupakan halaman admin untuk pengembalian buku
class AdminReturnActivity extends StatefulWidget {
  const AdminReturnActivity({super.key});

  @override
  State<AdminReturnActivity> createState() => _AdminReturnActivityState();
}

// Kelas state dari halaman AdminReturnActivity, di sinilah UI dan logika ditulis
class _AdminReturnActivityState extends State<AdminReturnActivity> {
  // Controller untuk menyimpan input dari kolom user
  final TextEditingController _userController = TextEditingController();

  // Controller untuk menyimpan input dari kolom buku
  final TextEditingController _bookController = TextEditingController();

  // List nama user yang tersedia, sebagai pilihan autocomplete
  final List<String> users = ["Haidar Sayyid", "Vito Varsya", "Bagas Wahyu"];

  // List judul buku yang bisa dipilih untuk dikembalikan
  final List<String> books = [
    "Sedekah tidak Membuat Anda Miskin",
    "Algoritma Nasi Goreng",
    "Tutorial Menjadi Pintar"
  ];

  void _showDialogOKE(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pengembalian Buku'),
          content: Text('Buku berhasil dikembalikan'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Oke")
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold adalah struktur dasar dari layar di Flutter
      appBar: AppBar(
        title: const Text(
          "Pengembalian Buku",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF4A0D00),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
          children: [
            const SizedBox(height: 16), // Spasi atas
            const Text(
              "Pilih User",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Widget Autocomplete untuk user
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                // Jika input kosong, jangan tampilkan opsi
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                // Tampilkan hanya user yang mengandung teks yang diketik (case insensitive)
                return users.where((String user) {
                  return user
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                // Ketika user memilih item dari autocomplete, masukkan ke controller
                _userController.text = selection;
              },
              // Mengatur tampilan field input Autocomplete
              fieldViewBuilder: (BuildContext context,
                  TextEditingController fieldController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                // Set isi awal dari controller agar sinkron
                fieldController.text = _userController.text;
                return TextField(
                  controller: fieldController, // Controller input user
                  focusNode: focusNode, // Fokus input
                  decoration: InputDecoration(
                    hintText: "Pilih User", // Teks petunjuk di field
                    fillColor: Colors.grey[200], // Warna latar field
                    border: UnderlineInputBorder(),
                  ),
                  onChanged: (value) {
                    // Update _userController saat diketik
                    _userController.text = value;
                  },
                );
              },
            ),

            const SizedBox(height: 16), // Spasi antar input

            // Label teks untuk input buku
            const Text(
              "Pilih Buku yang Dipinjam",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8), // Spasi bawah label

            // Widget Autocomplete untuk buku
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                // Jika input kosong, tidak tampilkan opsi
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                // Filter buku yang sesuai input
                return books.where((String book) {
                  return book
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                // Ketika dipilih, simpan ke controller
                _bookController.text = selection;
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController fieldController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                // Sinkronkan nilai awal
                fieldController.text = _bookController.text;
                return TextField(
                  controller: fieldController, // Controller input buku
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    hintText: "Pilih Buku yang Dipinjam",
                    fillColor: Colors.grey[200],
                    border: UnderlineInputBorder(),
                  ),
                  onChanged: (value) {
                    // Update controller buku jika diketik manual
                    _bookController.text = value;
                  },
                );
              },
            ),

            const SizedBox(height: 32), // Spasi sebelum tombol

            // Tombol untuk mengembalikan buku
            ElevatedButton(
              onPressed: () {
                _showDialogOKE(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Warna tombol
                padding: const EdgeInsets.symmetric(vertical: 12), // Tinggi tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Sudut membulat
                ),
              ),
              child: const Center(
                child: Text(
                  "Kembalikan Buku", // Teks di tombol
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            const Spacer(), // Mendorong semua ke atas, memberi ruang di bawah
          ],
        ),
      ),
    );
  }
}
