import 'package:flutter/material.dart';

class FormPengaduanScreen extends StatefulWidget {
  const FormPengaduanScreen({super.key});

  @override
  State<FormPengaduanScreen> createState() => _FormPengaduanScreenState();
}

class _FormPengaduanScreenState extends State<FormPengaduanScreen> {
  String? selectedKategori;
  final List<String> kategoriList = [
    'Kekerasan',
    'Bullying',
    'Diskriminasi',
    'Masalah Fasilitas',
    'Pelayanan Administrasi',
  ];

  final TextEditingController deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // ❌ Judul pengaduan dihapus
        title: null,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: selectedKategori,
              decoration: InputDecoration(
                hintText: 'Pilih Kategori',
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.green, width: 1.5),
                ),
              ),
              items: kategoriList.map((kategori) {
                return DropdownMenuItem<String>(
                  value: kategori,
                  child: Text(kategori),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedKategori = value;
                });
              },
            ),

            const SizedBox(height: 20),

            TextField(
              controller: deskripsiController,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Tulis deskripsi laporan kamu di sini...',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.green, width: 1.5),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.send_rounded, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  if (selectedKategori == null ||
                      deskripsiController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('⚠️ Lengkapi semua data terlebih dahulu!'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Laporan "$selectedKategori" berhasil dikirim 🎉'),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.green.shade600,
                    ),
                  );

                  setState(() {
                    selectedKategori = null;
                    deskripsiController.clear();
                  });
                },
                label: const Text(
                  'Kirim Laporan',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
