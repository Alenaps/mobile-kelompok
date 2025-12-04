import 'package:flutter/material.dart';

class VerifikasiLaporanScreen extends StatelessWidget {
  const VerifikasiLaporanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final laporan = [
      {"judul": "Pintu rusak di Aula", "status": "Menunggu"},
      {"judul": "Lampu mati di parkiran", "status": "Menunggu"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Verifikasi Laporan")),
      body: ListView.builder(
        itemCount: laporan.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(laporan[index]["judul"]!),
              subtitle: Text("Status: ${laporan[index]["status"]}"),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${laporan[index]["judul"]} diverifikasi")),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: const Text("Verifikasi"),
              ),
            ),
          );
        },
      ),
    );
  }
}
