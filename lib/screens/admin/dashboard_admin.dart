import 'package:flutter/material.dart';
import 'kelola_pengguna_screen.dart';
import 'verifikasi_laporan_screen.dart';
import 'pengaturan_screen.dart';
import 'statistik_screen.dart'; // <-- Import StatistikScreen

class DashboardAdmin extends StatelessWidget {
  const DashboardAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Dashboard Admin",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1.05,
          children: [
            _buildDashboardCard(
              context,
              title: "Verifikasi Laporan",
              icon: Icons.verified_outlined,
              color: Colors.blueAccent,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const VerifikasiLaporanScreen(),
                ),
              ),
            ),
            _buildDashboardCard(
              context,
              title: "Kelola Pengguna",
              icon: Icons.people_alt_outlined,
              color: Colors.teal,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const KelolaPenggunaScreen()),
              ),
            ),
            _buildDashboardCard(
              context,
              title: "Statistik",
              icon: Icons.bar_chart_outlined,
              color: Colors.orangeAccent,
              onTap: () {
                // NAVIGASI KE HALAMAN STATISTIK
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StatistikScreen()),
                );
              },
            ),
            _buildDashboardCard(
              context,
              title: "Pengaturan",
              icon: Icons.settings_outlined,
              color: Colors.purpleAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PengaturanScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha((0.15 * 255).round()),
              blurRadius: 8.0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withAlpha((0.15 * 255).round()),
              radius: 28,
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
