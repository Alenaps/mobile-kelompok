import 'package:flutter/material.dart';

class PengaturanScreen extends StatefulWidget {
  const PengaturanScreen({super.key});

  @override
  State<PengaturanScreen> createState() => _PengaturanScreenState();
}

class _PengaturanScreenState extends State<PengaturanScreen> {
  bool isDarkMode = false; // Tema
  bool notifEnabled = true; // Notifikasi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black87 : Colors.grey[100],
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black87 : Colors.white,
        elevation: 0,
        title: Text(
          "Settings Admin",
          style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black87,
              fontWeight: FontWeight.bold),
        ),
        iconTheme:
            IconThemeData(color: isDarkMode ? Colors.white : Colors.black87),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSettingTile(
            icon: Icons.person_outline,
            title: "Manajemen Akun Admin",
            subtitle: "Edit profil dan data akun",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const EditProfilScreen()),
            ),
          ),
          _buildSettingTile(
            icon: Icons.lock_outline,
            title: "Ubah Password",
            subtitle: "Masukkan password baru bebas",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const UbahPasswordScreen()),
            ),
          ),
          _buildSettingTile(
            icon: Icons.color_lens_outlined,
            title: "Tema Aplikasi",
            subtitle: "Mode terang / gelap",
            trailingWidget: Switch(
              value: isDarkMode,
              onChanged: (val) {
                setState(() {
                  isDarkMode = val;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text("Mode ${isDarkMode ? 'Gelap' : 'Terang'} diaktifkan"),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
            onTap: () {},
          ),
          _buildSettingTile(
            icon: Icons.notifications_none,
            title: "Notifikasi",
            subtitle: "Atur notifikasi aplikasi",
            onTap: () => _showNotifDialog(),
            trailingWidget: Switch(
              value: notifEnabled,
              onChanged: (val) {
                setState(() {
                  notifEnabled = val;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "Notifikasi ${notifEnabled ? 'diaktifkan' : 'dimatikan'}"),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          ),
          _buildSettingTile(
            icon: Icons.storage_outlined,
            title: "Backup & Restore Data",
            subtitle: "Kelola cadangan data",
            onTap: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("Backup & Restore"),
                content: const Text(
                    "Fungsi backup dan restore data akan segera tersedia."),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Tutup"),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildLogoutButton(context),
        ],
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Widget? trailingWidget,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: trailingWidget ?? const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
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
                child: const Text("Logout",
                    style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
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

  void _showNotifDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Pengaturan Notifikasi"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SwitchListTile(
              title: Text(notifEnabled ? "Notifikasi Aktif" : "Notifikasi Mati"),
              value: notifEnabled,
              onChanged: (val) {
                setState(() {
                  notifEnabled = val;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "Notifikasi ${notifEnabled ? 'diaktifkan' : 'dimatikan'}"),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            const Text(
              "Atur apakah notifikasi aplikasi diaktifkan atau dimatikan.",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Tutup"),
          ),
        ],
      ),
    );
  }
}

// Edit Profil Admin
class EditProfilScreen extends StatefulWidget {
  const EditProfilScreen({super.key});

  @override
  State<EditProfilScreen> createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
  final _formKey = GlobalKey<FormState>();
  String nama = "Admin";
  String email = "admin@example.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profil Admin")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: nama,
                decoration: const InputDecoration(labelText: "Nama"),
                validator: (val) =>
                    val == null || val.isEmpty ? "Nama tidak boleh kosong" : null,
                onSaved: (val) => nama = val ?? nama,
              ),
              TextFormField(
                initialValue: email,
                decoration: const InputDecoration(labelText: "Email"),
                validator: (val) =>
                    val == null || val.isEmpty ? "Email tidak boleh kosong" : null,
                onSaved: (val) => email = val ?? email,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Profil berhasil diperbarui")),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text("Simpan"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Ubah Password Admin (bebas)
class UbahPasswordScreen extends StatefulWidget {
  const UbahPasswordScreen({super.key});

  @override
  State<UbahPasswordScreen> createState() => _UbahPasswordScreenState();
}

class _UbahPasswordScreenState extends State<UbahPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String newPassword = "";
  String confirmPassword = "";
  bool obscureNew = true;
  bool obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Password Admin")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                obscureText: obscureNew,
                decoration: InputDecoration(
                  labelText: "Password Baru",
                  suffixIcon: IconButton(
                    icon: Icon(
                        obscureNew ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        obscureNew = !obscureNew;
                      });
                    },
                  ),
                ),
                onSaved: (val) => newPassword = val ?? "",
              ),
              TextFormField(
                obscureText: obscureConfirm,
                decoration: InputDecoration(
                  labelText: "Konfirmasi Password",
                  suffixIcon: IconButton(
                    icon: Icon(obscureConfirm
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        obscureConfirm = !obscureConfirm;
                      });
                    },
                  ),
                ),
                onSaved: (val) => confirmPassword = val ?? "",
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Password berhasil diubah")),
                  );
                  Navigator.pop(context);
                },
                child: const Text("Simpan"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
