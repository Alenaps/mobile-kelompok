import 'package:flutter/material.dart';

class StatusLaporanScreen extends StatelessWidget {
  const StatusLaporanScreen({super.key});

  final List<Map<String, dynamic>> laporanList = const [
    {
      "judul": "Fasilitas Rusak di Gedung B",
      "status": "Diproses",
      "icon": "assets/gedung_rusak.jpg"
    },
    {
      "judul": "Air Tidak Mengalir di Toilet",
      "status": "Selesai",
      "icon": "assets/keran_rusak.jpg"
    },
    {
      "judul": "Lampu Padam di Ruang Kelas",
      "status": "Menunggu",
      "icon": "assets/mati_lampu.jpg"
    },
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case "Selesai":
        return Colors.green;
      case "Diproses":
        return Colors.orange;
      case "Menunggu":
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),
      appBar: AppBar(
        title: const Text(
          "Status Laporan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4CAF50),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: laporanList.length,
          itemBuilder: (context, index) {
            final laporan = laporanList[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListTile(
                leading: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4CAF50),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Image.asset(
                      laporan["icon"],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                title: Text(
                  laporan["judul"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Row(
                  children: [
                    const Text("Status: "),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getStatusColor(laporan["status"]).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        laporan["status"],
                        style: TextStyle(
                          color: _getStatusColor(laporan["status"]),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.teal),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(laporan["judul"]),
                      content: Text(
                        "Status laporan kamu saat ini adalah '${laporan["status"]}'. "
                        "Terima kasih telah melapor! Kami akan menindaklanjuti segera.",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Tutup", style: TextStyle(color: Colors.teal)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
