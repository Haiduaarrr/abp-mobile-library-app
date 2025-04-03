import 'package:flutter/material.dart';
import 'package:intl/intl.dart';   // Package untuk membuat pilih tanggal (download: flutter pub add intl)

class AdminRequest extends StatefulWidget {
  const AdminRequest({super.key});

  @override
  _AdminRequestState createState() => _AdminRequestState();
}

class _AdminRequestState extends State<AdminRequest> {
  // state untuk memilih tanggal peminjaman buku
  final TextEditingController _borrowDateController = TextEditingController();

  // state untuk memilih tanggal pengembalian buku
  final TextEditingController _returnDateController = TextEditingController();

  // Untuk fungsi pemilihan tanggal
  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  // Fungsi untuk menampilkan Dialog
  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Peminjaman'), // Judul dialog
            content: Text('Peminjaman telah berhasil'), // Isi dialog
            actions: [
              // Tombol untuk menutup dialog
              TextButton(
                // tambahkan 
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Permintaan Peminjaman Buku",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF4A0D00),
        iconTheme: IconThemeData(
          color: Colors.white,

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            const Text("Pilih User"),
            DropdownButtonFormField<String>(
              items: ["User 1", "User 2"].map((String user) {
                return DropdownMenuItem<String>(
                  value: user,
                  child: Text(user),
                );
              }).toList(),
              onChanged: (value) {},
              decoration: const InputDecoration(border: UnderlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const Text("Pilih Buku"),
            DropdownButtonFormField<String>(
              items: ["Buku A", "Buku B"].map((String book) {
                return DropdownMenuItem<String>(
                  value: book,
                  child: Text(book),
                );
              }).toList(),
              onChanged: (value) {},
              decoration: const InputDecoration(border: UnderlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _borrowDateController,
              decoration: InputDecoration(
                labelText: "Tanggal Pinjam (YYYY-MM-DD)",
                border: UnderlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context, _borrowDateController),
                ),
              ),
              readOnly: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _returnDateController,
              decoration: InputDecoration(
                labelText: "Tanggal Kembali (YYYY-MM-DD)",
                border: UnderlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context, _returnDateController),
                ),
              ),
              readOnly: true,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Memposisikan baris ke tengah
              children: [
                SizedBox(
                  width: 160,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () => _showDialog(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green
                    ),
                    child: const Text(
                        "Terima",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,

                      )
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 160,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text(
                        "Tolak",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}
