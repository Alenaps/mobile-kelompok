import 'package:flutter/material.dart';
import 'form_pengaduan_screen.dart';
import 'status_laporan_screen.dart';
import 'profile_screen.dart';

class DashboardMahasiswa extends StatefulWidget {
  const DashboardMahasiswa({super.key});

  @override
  State<DashboardMahasiswa> createState() => _DashboardMahasiswaState();
}

class _DashboardMahasiswaState extends State<DashboardMahasiswa> {
  int _selectedIndex = 0;
  bool _notifAktif = true; // ⬅️ STATUS NOTIFIKASI

  final List<Widget> _pages = const [
    FormPengaduanScreen(),
    StatusLaporanScreen(),
    ProfileScreen(),
  ];

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
        backgroundColor:
            _notifAktif ? Colors.green.shade600 : Colors.red.shade600,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FBF7),

      // ================= APP BAR =================
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,

        title: _selectedIndex == 2
            ? const Text(
                'Profil Mahasiswa',
                style: TextStyle(
                  color: Color(0xFF4CAF50),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            : null,

        actions: [
          IconButton(
            icon: Icon(
              _notifAktif
                  ? Icons.notifications_active_outlined
                  : Icons.notifications_off_outlined,
              color: _notifAktif
                  ? const Color(0xFF009688)
                  : Colors.grey,
            ),
            onPressed: _toggleNotifikasi, // ⬅️ FUNGSI AKTIF
          ),
        ],
      ),

      // ================= BODY =================
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
      ),

      // ================= BOTTOM NAV =================
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.teal.withValues(alpha: 0.1),
              blurRadius: 12,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xFF009688),
            unselectedItemColor: Colors.grey[500],
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            onTap: (index) => setState(() => _selectedIndex = index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment_outlined),
                activeIcon: Icon(Icons.assignment),
                label: 'Lapor',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fact_check_outlined),
                activeIcon: Icon(Icons.fact_check),
                label: 'Status',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                activeIcon: Icon(Icons.account_circle),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
