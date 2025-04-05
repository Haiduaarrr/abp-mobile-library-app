import 'package:flutter/material.dart';

class ManageUsers extends StatelessWidget {
  const ManageUsers({super.key});

  @override
  Widget build(BuildContext context) {
    //final List<Map<String, dynamic>> users = []; // Kosong untuk menampilkan kondisi tanpa data
    // Contoh data dummy
    final List<Map<String, dynamic>> users = [
      {
        "name": "Haidar Sayyid",
        "books": [
          {"title": "Sedekah tidak Membuat Anda Miskin", "date": "2022-08-21", "status": "returned"},
          {"title": "Algoritma Nasi Goreng", "date": "2020-03-03", "status": "borrowed"},
        ]
      },
      {
        "name": "Vito Varsya",
        "books": [
          {"title": "Sedekah tidak Membuat Anda Miskin", "date": "2030-12-22", "status": "borrowed"},
          {"title": "Algoritma Nasi Goreng", "date": "2030-11-11", "status": "returned"},
        ]
      },
      {
        "name": "Bagas Wahyu",
        "books": [
          {"title": "Algoritma Nasi Goreng", "date": "2025-05-04", "status": "returned"},
          {"title": "Tutorial Menjadi Pintar", "date": "2025-08-09", "status": "returned"},
        ]
      },
    ];


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengelolaan Pengguna",
          style: TextStyle(
              fontSize: 24,
              color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor:  Color(0xFF4A0D00),
        iconTheme: IconThemeData(
            color: Colors.white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: users.isEmpty
            ? const Center(
          child: Text(
            "Data pengguna kosong",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        )
            : Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user["name"],
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(height: 4),
                          ...user["books"].map<Widget>((book) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Title: ${book["title"]}"),
                                  Text("Date: ${book["date"]}"),
                                  Text("Status: ${book["status"]}"),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}
