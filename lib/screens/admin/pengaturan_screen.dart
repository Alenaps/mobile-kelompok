import 'package:flutter/material.dart';

// ===== GLOBAL THEME =======
ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
ValueNotifier<String> notifStatusNotifier = ValueNotifier("Notifikasi Aktif");

// ===== MANAGEMEN AKUN ADMIN =======
class ManajemenAkunScreen extends StatefulWidget {
  const ManajemenAkunScreen({super.key});

  @override
  State<ManajemenAkunScreen> createState() => _ManajemenAkunScreenState();
}

class _ManajemenAkunScreenState extends State<ManajemenAkunScreen> {
  final _formKey = GlobalKey<FormState>();
  String nama = "Achmad Waspodo";
  String username = "@achmadoo";
  String email = "achmado11@gmail.com";
  String telepon = "082361760101";
  String alamat = "Gg. Rajabasa Raya";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manajemen Akun Admin"),
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.green[700],
                  child: const Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green[700]!, Colors.green[500]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withValues(alpha: 0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        nama,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha:0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          username,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Informasi Akun",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  initialValue: nama,
                  decoration: const InputDecoration(
                    labelText: "Nama",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  onSaved: (value) => nama = value ?? "",
                ),
                const SizedBox(height: 15),
                TextFormField(
                  initialValue: email,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  onSaved: (value) => email = value ?? "",
                ),
                const SizedBox(height: 15),
                TextFormField(
                  initialValue: telepon,
                  decoration: const InputDecoration(
                    labelText: "Telepon",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  onSaved: (value) => telepon = value ?? "",
                ),
                const SizedBox(height: 15),
                TextFormField(
                  initialValue: alamat,
                  decoration: const InputDecoration(
                    labelText: "Alamat",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  maxLines: 3,
                  onSaved: (value) => alamat = value ?? "",
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Profil berhasil diperbarui"),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  ),
                  child: const Text(
                    "Simpan",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ===== UBAH PASSWORD =======
class UbahPasswordScreen extends StatefulWidget {
  const UbahPasswordScreen({super.key});

  @override
  State<UbahPasswordScreen> createState() => _UbahPasswordScreenState();
}

class _UbahPasswordScreenState extends State<UbahPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String passwordLama = "";
  String passwordBaru = "";
  String konfirmasiPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Password"),
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password Lama",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                onSaved: (value) => passwordLama = value ?? "",
              ),
              const SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password Baru",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                onSaved: (value) => passwordBaru = value ?? "",
              ),
              const SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Konfirmasi Password Baru",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_clock),
                ),
                onSaved: (value) => konfirmasiPassword = value ?? "",
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Password berhasil diubah"),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                ),
                child: const Text(
                  "Ubah Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ===== TEMA APLIKASI =======
class TemaAplikasiScreen extends StatelessWidget {
  const TemaAplikasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tema Aplikasi"),
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ValueListenableBuilder(
          valueListenable: themeNotifier,
          builder: (context, ThemeMode currentMode, _) {
            return Column(
              children: [
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.light_mode, color: Colors.orange),
                    title: const Text("Mode Terang"),
                    trailing: Radio<ThemeMode>(
                      value: ThemeMode.light,
                      groupValue: currentMode,
                      onChanged: (value) {
                        themeNotifier.value = value!;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Mode Terang Aktif"),
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.dark_mode, color: Colors.indigo),
                    title: const Text("Mode Gelap"),
                    trailing: Radio<ThemeMode>(
                      value: ThemeMode.dark,
                      groupValue: currentMode,
                      onChanged: (value) {
                        themeNotifier.value = value!;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Mode Gelap Aktif"),
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ===== NOTIFIKASI =======
class NotifikasiScreen extends StatefulWidget {
  const NotifikasiScreen({super.key});

  @override
  State<NotifikasiScreen> createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> {
  bool notifEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifikasi"),
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SwitchListTile(
                title: const Text("Aktifkan Notifikasi"),
                subtitle: const Text("Terima notifikasi dari aplikasi"),
                secondary: Icon(
                  Icons.notifications_active,
                  color: Colors.green[700],
                ),
                value: notifEnabled,
                onChanged: (val) {
                  setState(() {
                    notifEnabled = val;
                    notifStatusNotifier.value =
                        notifEnabled ? "Notifikasi Aktif" : "Notifikasi Nonaktif";
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        notifEnabled
                            ? "Notifikasi telah diaktifkan"
                            : "Notifikasi telah dinonaktifkan",
                      ),
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: notifEnabled ? Colors.green[50] : Colors.red[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: notifEnabled ? Colors.green[200]! : Colors.red[200]!,
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    notifEnabled ? Icons.check_circle : Icons.cancel,
                    color: notifEnabled ? Colors.green[700] : Colors.red[700],
                    size: 30,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: notifStatusNotifier,
                      builder: (context, String status, _) {
                        return Text(
                          status,
                          style: TextStyle(
                            fontSize: 16,
                            color: notifEnabled ? Colors.green[700] : Colors.red[700],
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===== BACKUP & RESTORE =======
class BackupRestoreScreen extends StatelessWidget {
  const BackupRestoreScreen({super.key});

  void backupData(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Backup data berhasil"),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void restoreData(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Restore data berhasil"),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Backup & Restore Data"),
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue[200]!, width: 2),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.blue[700], size: 28),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      "Kelola data cadangan aplikasi Anda",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => backupData(context),
                icon: const Icon(Icons.backup),
                label: const Text(
                  "Backup Data",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => restoreData(context),
                icon: const Icon(Icons.restore),
                label: const Text(
                  "Restore Data",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[700],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
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

// ===== PENGATURAN SCREEN =======
class PengaturanScreen extends StatelessWidget {
  const PengaturanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, ThemeMode themeMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.green[700],
            scaffoldBackgroundColor: Colors.green[50],
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.green[700],
            scaffoldBackgroundColor: Colors.black87,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: const Text("Pengaturan Admin"),
              backgroundColor: Colors.green[700],
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildTile(
                  context,
                  icon: Icons.person_outline,
                  title: "Manajemen Akun Admin",
                  subtitle: "Edit profil dan data akun",
                  page: const ManajemenAkunScreen(),
                ),
                _buildTile(
                  context,
                  icon: Icons.lock_outline,
                  title: "Ubah Password",
                  subtitle: "Ganti password keamanan akun",
                  page: const UbahPasswordScreen(),
                ),
                _buildTile(
                  context,
                  icon: Icons.color_lens_outlined,
                  title: "Tema Aplikasi",
                  subtitle: "Mode terang / gelap",
                  page: const TemaAplikasiScreen(),
                ),
                _buildTile(
                  context,
                  icon: Icons.notifications_none,
                  title: "Notifikasi",
                  subtitle: "Atur notifikasi aplikasi",
                  page: const NotifikasiScreen(),
                ),
                _buildTile(
                  context,
                  icon: Icons.storage_outlined,
                  title: "Backup & Restore Data",
                  subtitle: "Kelola cadangan data",
                  page: const BackupRestoreScreen(),
                ),
                const SizedBox(height: 20),
                _buildLogoutButton(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTile(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required Widget page}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.green[700]),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text("Konfirmasi Logout"),
              content: const Text("Anda yakin ingin keluar dari admin?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Batal"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.logout, color: Colors.red),
      label: const Text(
        "Logout",
        style: TextStyle(color: Colors.red, fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFEBEE),
        foregroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}