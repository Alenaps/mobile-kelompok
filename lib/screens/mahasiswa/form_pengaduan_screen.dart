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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Form Pengaduan',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Judul section
              const Text(
                'Kategori Laporan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              // --- Dropdown modern
              DropdownButtonFormField<String>(
                initialValue: selectedKategori,
                decoration: InputDecoration(
                  hintText: 'Pilih Kategori',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.indigo, width: 1.5),
                  ),
                ),
                items: kategoriList
                    .map((kategori) => DropdownMenuItem(
                          value: kategori,
                          child: Text(kategori),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedKategori = value;
                  });
                },
              ),

              const SizedBox(height: 24),

              // --- Deskripsi laporan
              const Text(
                'Deskripsi Laporan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              TextField(
                controller: deskripsiController,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: 'Tulis deskripsi laporan kamu di sini...',
                  filled: true,
                  fillColor: Colors.white,
                  alignLabelWithHint: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFF4CAF50), width: 1.5),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // --- Tombol Kirim
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.send_rounded, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 45, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    backgroundColor: const Color(0xFF4CAF50),
                    shadowColor: const Color(0xFF4CAF50).withValues(alpha: 0.3),
                  ),
                  onPressed: () {
                    if (selectedKategori == null ||
                        deskripsiController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('⚠️ Lengkapi semua data terlebih dahulu!'),
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

                    // Reset form
                    setState(() {
                      selectedKategori = null;
                      deskripsiController.clear();
                    });
                  },
                  label: const Text(
                    'Kirim Laporan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
