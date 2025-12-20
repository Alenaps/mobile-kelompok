import 'package:flutter/material.dart';

class NotifikasiMahasiswaScreen extends StatefulWidget {
  const NotifikasiMahasiswaScreen({super.key});

  @override
  State<NotifikasiMahasiswaScreen> createState() =>
      _NotifikasiMahasiswaScreenState();
}

class _NotifikasiMahasiswaScreenState extends State<NotifikasiMahasiswaScreen> {
  bool _notifAktif = true; // ⬅️ KODE LAMA ANDA, DIPINDAH KE SINI

  void _toggleNotifikasi() {
    setState(() {
      _notifAktif = !_notifAktif;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _notifAktif
              ? '🔔 Notifikasi diaktifkan'
              : '🔕 Notifikasi dinonaktifkan',
        ),
        backgroundColor: _notifAktif
            ? Colors.green.shade600
            : Colors.red.shade600,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifikasi'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ===== TOGGLE NOTIFIKASI =====
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: SwitchListTile(
              title: const Text(
                'Aktifkan Notifikasi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                _notifAktif
                    ? 'Notifikasi sedang aktif'
                    : 'Notifikasi sedang nonaktif',
              ),
              value: _notifAktif,
              activeThumbColor: const Color(0xFF009688),
              onChanged: (value) => _toggleNotifikasi(),
            ),
          ),

          const SizedBox(height: 24),

          // ===== LIST NOTIFIKASI (DUMMY) =====
          const _ItemNotifikasi(
            judul: 'Pengaduan Diterima',
            isi: 'Pengaduan Anda berhasil dikirim ke sistem.',
            waktu: '3 hari lalu',
          ),
          const _ItemNotifikasi(
            judul: 'Pengaduan Diproses',
            isi: 'Pengaduan Anda sedang ditangani petugas.',
            waktu: '1 hari lalu',
          ),
          const _ItemNotifikasi(
            judul: 'Pengaduan Selesai',
            isi: 'Pengaduan Anda telah diselesaikan.',
            waktu: '2 jam lalu',
          ),
        ],
      ),
    );
  }
}

class _ItemNotifikasi extends StatelessWidget {
  final String judul;
  final String isi;
  final String waktu;

  const _ItemNotifikasi({
    required this.judul,
    required this.isi,
    required this.waktu,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        leading: const Icon(Icons.notifications, color: Color(0xFF009688)),
        title: Text(judul, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(isi),
        trailing: Text(
          waktu,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
