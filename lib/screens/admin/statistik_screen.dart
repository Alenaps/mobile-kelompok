import 'package:flutter/material.dart';

/// File: statistik_screen.dart
/// Versi: Full, self-contained
/// Fitur:
/// - Statistik dinamis berdasarkan `allReports`
/// - Halaman detail (All / Selesai / Menunggu) menampilkan Card List (Model A)
/// - Menampilkan kategori, username pelapor, dan status

class StatistikScreen extends StatelessWidget {
  const StatistikScreen({super.key});

  // DATA Laporan (master list) — tambahkan / ubah sesuai kebutuhan
  static final List<Map<String, String>> allReports = [
    {
      "judul": "Fasilitas di Gedung B",
      "kategori": "Masalah Fasilitas",
      "pelapor": "Putri Alena Sari",
      "username": "putrialena",
      "status": "Diproses"
    },
    {
      "judul": "Air Tidak Mengalir di Toilet",
      "kategori": "Masalah Fasilitas",
      "pelapor": "Rizky Saputra",
      "username": "rizkysaputra",
      "status": "Selesai"
    },
    {
      "judul": "Lampu Padam di Ruang Kelas",
      "kategori": "Masalah Fasilitas",
      "pelapor": "Bagus Pratama",
      "username": "baguspr",
      "status": "Menunggu Verifikasi"
    },
    // contoh tambahan (agar jumlah terlihat realistis)
    {
      "judul": "Kursi Rusak di Laboratorium",
      "kategori": "Masalah Fasilitas",
      "pelapor": "Ayu Prameswari",
      "username": "ayupr",
      "status": "Diproses"
    },
    {
      "judul": "Perundungan di Koridor",
      "kategori": "Bullying",
      "pelapor": "Febrian Angga",
      "username": "febriangga",
      "status": "Menunggu Verifikasi"
    },
    {
      "judul": "Pembuatan Surat Lambat",
      "kategori": "Administrasi",
      "pelapor": "Dewi Amelia",
      "username": "dewiamelia",
      "status": "Selesai"
    },
  ];

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF4CAF50);
    const Color statistikColor = Color(0xFFFB8C00);
    const Color laporanColor = Color(0xFF00BCD4);
    const Color pengaturanColor = Color(0xFF9C27B0);

    // hitung dinamis
    final int totalReports = allReports.length;
    final int selesaiCount = allReports.where((r) => r["status"] == "Selesai").length;
    final int menungguCount = allReports
        .where((r) => r["status"] == "Menunggu Verifikasi" || r["status"] == "Menunggu")
        .length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistik Admin', style: TextStyle(color: Colors.white)),
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          StatistikCard(
            title: 'Total Pengguna Terdaftar',
            value: '15',
            icon: Icons.people_alt,
            iconColor: statistikColor,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailPenggunaScreen()));
            },
          ),
          const SizedBox(height: 16),

          StatistikCard(
            title: 'Total Laporan Masuk',
            value: totalReports.toString(),
            icon: Icons.inbox,
            iconColor: laporanColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ReportsListScreen.filterAll(allReports)),
              );
            },
          ),
          const SizedBox(height: 16),

          StatistikCard(
            title: 'Laporan Selesai Ditangani',
            value: selesaiCount.toString(),
            icon: Icons.check_circle,
            iconColor: primaryColor,
            onTap: () {
              final done = allReports.where((r) => r["status"] == "Selesai").toList();
              Navigator.push(context, MaterialPageRoute(builder: (_) => ReportsListScreen.filter(done, title: "Laporan Selesai")));
            },
          ),
          const SizedBox(height: 16),

          StatistikCard(
            title: 'Menunggu Verifikasi',
            value: menungguCount.toString(),
            icon: Icons.pending_actions,
            iconColor: pengaturanColor,
            onTap: () {
              final waiting = allReports.where((r) => r["status"] == "Menunggu Verifikasi" || r["status"] == "Menunggu").toList();
              Navigator.push(context, MaterialPageRoute(builder: (_) => ReportsListScreen.filter(waiting, title: "Menunggu Verifikasi")));
            },
          ),
          const SizedBox(height: 16),

          StatistikCard(
            title: 'Kategori Laporan',
            value: '6 Jenis',
            icon: Icons.category,
            iconColor: const Color(0xFFEF5350),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const KategoriLaporanScreen()));
            },
          ),
        ],
      ),
    );
  }
}

/// ----------------- StatistikCard -----------------
class StatistikCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;

  const StatistikCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            // gunakan withValues untuk menghindari deprecated
            BoxShadow(color: Colors.grey.withValues(alpha: 0.25), blurRadius: 6, offset: const Offset(0, 3)),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: iconColor.withValues(alpha: 0.18),
              child: Icon(icon, color: iconColor, size: 30),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: const TextStyle(fontSize: 16, color: Colors.black54)),
                const SizedBox(height: 6),
                Text(value, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87)),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

/// ---------------- ReportsListScreen (Model A - Card List) ----------------
class ReportsListScreen extends StatelessWidget {
  final List<Map<String, String>> reports;
  final String title;

  const ReportsListScreen._(this.reports, {super.key, required this.title});

  // factory untuk semua laporan
  factory ReportsListScreen.filterAll(List<Map<String, String>> allReports) {
    // pastikan salinan list berformat Map<String,String>
    final copy = allReports.map((m) => Map<String, String>.from(m)).toList();
    return ReportsListScreen._(copy, title: "Semua Laporan");
  }

  // factory untuk filtered
  factory ReportsListScreen.filter(List<Map<String, String>> filtered, {String title = "Laporan"}) {
    final copy = filtered.map((m) => Map<String, String>.from(m)).toList();
    return ReportsListScreen._(copy, title: title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title, style: const TextStyle(color: Colors.white)), backgroundColor: const Color(0xFF4CAF50)),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: reports.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final r = reports[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(r["judul"] ?? "-", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  Text("Kategori: ${r["kategori"] ?? '-'}"),
                  const SizedBox(height: 4),
                  Text("Pelapor: ${r["pelapor"] ?? '-'} (@${r["username"] ?? '-'})"),
                  const SizedBox(height: 6),
                  Text("Status: ${r["status"] ?? '-'}", style: const TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// ---------------- Kategori Laporan Screen ----------------
class KategoriLaporanScreen extends StatelessWidget {
  const KategoriLaporanScreen({super.key});

  final List<Map<String, dynamic>> kategoriList = const [
    {"nama": "Kekerasan", "icon": Icons.security, "color": Colors.red},
    {"nama": "Bullying", "icon": Icons.report_problem, "color": Colors.orange},
    {"nama": "Diskriminasi", "icon": Icons.gavel, "color": Colors.blue},
    {"nama": "Masalah Fasilitas", "icon": Icons.home_repair_service, "color": Colors.teal},
    {"nama": "Pelayanan", "icon": Icons.support_agent, "color": Colors.green},
    {"nama": "Administrasi", "icon": Icons.assignment, "color": Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kategori Laporan", style: TextStyle(color: Colors.white)), backgroundColor: const Color(0xFF4CAF50)),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: kategoriList.length,
        itemBuilder: (context, index) {
          final kategori = kategoriList[index];
          return Card(
            elevation: 3,
            child: ListTile(
              leading: Icon(kategori["icon"], color: kategori["color"], size: 30),
              title: Text(kategori["nama"], style: const TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                // optional: filter by category from master list
                final filtered = StatistikScreen.allReports.where((r) => r["kategori"] == kategori["nama"]).toList();
                Navigator.push(context, MaterialPageRoute(builder: (_) => ReportsListScreen.filter(filtered, title: kategori["nama"])));
              },
            ),
          );
        },
      ),
    );
  }
}

/// ---------------- Detail Pengguna (tetap) ----------------
class DetailPenggunaScreen extends StatelessWidget {
  const DetailPenggunaScreen({super.key});

  final List<Map<String, String>> users = const [
    {"nama": "Putri Alena Sari", "npm": "2377051001", "email": "putri@example.com", "telp": "081234567890", "alamat": "Bandung"},
    {"nama": "Rizky Saputra", "npm": "2377051002", "email": "rizky@example.com", "telp": "081233456789", "alamat": "Jakarta"},
    {"nama": "Bagus Pratama", "npm": "2377051003", "email": "bagus@example.com", "telp": "082134567890", "alamat": "Bekasi"},
    {"nama": "Rina Salma", "npm": "2377051004", "email": "rina@example.com", "telp": "083234567899", "alamat": "Depok"},
    {"nama": "Agus Hermawan", "npm": "2377051005", "email": "agus@example.com", "telp": "082345678901", "alamat": "Bogor"},
    {"nama": "Lisa Aprilia", "npm": "2377051006", "email": "lisa@example.com", "telp": "081234890765", "alamat": "Tangerang"},
    {"nama": "Febrian Angga", "npm": "2377051007", "email": "angga@example.com", "telp": "082137891234", "alamat": "Cimahi"},
    {"nama": "Dewi Amelia", "npm": "2377051008", "email": "dewi@example.com", "telp": "081278345900", "alamat": "Surabaya"},
    {"nama": "Putra Aditya", "npm": "2377051009", "email": "putra@example.com", "telp": "083567234780", "alamat": "Semarang"},
    {"nama": "Ayu Prameswari", "npm": "2377051010", "email": "ayu@example.com", "telp": "085612345778", "alamat": "Yogyakarta"},
    {"nama": "Yoga Adhitia", "npm": "2377051011", "email": "yoga@example.com", "telp": "081312456987", "alamat": "Malang"},
    {"nama": "Bella Safira", "npm": "2377051012", "email": "bella@example.com", "telp": "081200456789", "alamat": "Batam"},
    {"nama": "Citra Lestari", "npm": "2377051013", "email": "citra@example.com", "telp": "082198765432", "alamat": "Medan"},
    {"nama": "Andi Pratomo", "npm": "2377051014", "email": "andi@example.com", "telp": "081348765210", "alamat": "Bali"},
    {"nama": "Salsa Putri", "npm": "2377051015", "email": "salsa@example.com", "telp": "081345678900", "alamat": "Bandung"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pengguna", style: TextStyle(color: Colors.white)), backgroundColor: const Color(0xFF4CAF50)),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text("${user["nama"]} - ${user["npm"]}", style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Email: ${user["email"]}\nNo Telp: ${user["telp"]}\nAlamat: ${user["alamat"]}", style: const TextStyle(height: 1.4)),
            ),
          );
        },
      ),
    );
  }
}
