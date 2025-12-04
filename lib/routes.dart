import 'package:flutter/material.dart';

// Import semua screen
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';

// Mahasiswa
import 'screens/mahasiswa/dashboard_mahasiswa.dart';
import 'screens/mahasiswa/form_pengaduan_screen.dart';
import 'screens/mahasiswa/status_laporan_screen.dart';
import 'screens/mahasiswa/profile_screen.dart';

// Petugas
import 'screens/petugas/dashboard_petugas.dart';
import 'screens/petugas/detail_laporan_screen.dart';

// Admin
import 'screens/admin/dashboard_admin.dart';
import 'screens/admin/kelola_pengguna_screen.dart';
import 'screens/admin/verifikasi_laporan_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const SplashScreen(),
  '/login': (context) => const LoginScreen(),

  // Mahasiswa
  '/dashboardMahasiswa': (context) => const DashboardMahasiswa(),
  '/formPengaduan': (context) => const FormPengaduanScreen(),
  '/statusLaporan': (context) => const StatusLaporanScreen(),
  '/profileMahasiswa': (context) => const ProfileScreen(),

  // Petugas
  '/dashboardPetugas': (context) => const DashboardPetugas(),
  '/detailLaporan': (context) => const DetailLaporanScreen(),

  // Admin
  '/dashboardAdmin': (context) => const DashboardAdmin(),
  '/kelolaPengguna': (context) => const KelolaPenggunaScreen(),
  '/verifikasiLaporan': (context) => const VerifikasiLaporanScreen(),
   
};
