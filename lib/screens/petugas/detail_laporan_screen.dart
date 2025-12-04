import 'package:flutter/material.dart';

class DetailLaporanScreen extends StatefulWidget {
  const DetailLaporanScreen({super.key});

  @override
  State<DetailLaporanScreen> createState() => _DetailLaporanScreenState();
}

class _DetailLaporanScreenState extends State<DetailLaporanScreen> {
  String selectedStatus = 'Diproses';
  final TextEditingController tanggapanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Laporan")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Kategori: Fasilitas Rusak", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            const Text("Deskripsi: Kursi di ruang kuliah patah."),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              initialValue : selectedStatus,
              items: const [
                DropdownMenuItem(value: "Dikirim", child: Text("Dikirim")),
                DropdownMenuItem(value: "Diproses", child: Text("Diproses")),
                DropdownMenuItem(value: "Selesai", child: Text("Selesai")),
              ],
              onChanged: (value) => setState(() => selectedStatus = value!),
              decoration: const InputDecoration(labelText: "Ubah Status"),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: tanggapanController,
              decoration: const InputDecoration(
                labelText: "Tanggapan Petugas",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Status diperbarui!")));
                Navigator.pop(context);
              },
              child: const Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
