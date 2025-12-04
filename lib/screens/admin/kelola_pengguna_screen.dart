import 'package:flutter/material.dart';

class KelolaPenggunaScreen extends StatelessWidget {
  const KelolaPenggunaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pengguna = [
      {"nama": "Putri Alena", "role": "Mahasiswa"},
      {"nama": "Doni Setiawan", "role": "Petugas"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Kelola Pengguna")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: pengguna.length,
        itemBuilder: (context, index) {
          final user = pengguna[index];
          return Card(
            child: ListTile(
              title: Text(user["nama"]!),
              subtitle: Text("Peran: ${user["role"]}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${user["nama"]} dihapus")),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
