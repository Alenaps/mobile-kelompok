import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedRole = 'Mahasiswa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo / judul aplikasi
              Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withValues(alpha: 0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.school, size: 45, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "CampusCare",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFF2E7D32),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // const Text(
                  //   "Aplikasi Pelaporan",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(color: Colors.grey, fontSize: 14),
                 // ),
                ],
              ),

              const SizedBox(height: 50),

              // Form input
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha:0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildTextField(
                      label: "Email",
                      icon: Icons.email_outlined,
                      hintText: "masukkan email anda",
                    ),
                    const SizedBox(height: 15),
                    _buildTextField(
                      label: "Password",
                      icon: Icons.lock_outline,
                      obscureText: true,
                      hintText: "masukkan password anda",
                    ),
                    const SizedBox(height: 15),
                    DropdownButtonFormField<String>(
                      initialValue: selectedRole,
                      decoration: InputDecoration(
                        labelText: "Pilih Peran",
                        prefixIcon: const Icon(Icons.account_circle_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF1F8E9),
                      ),
                      items: ['Mahasiswa', 'Petugas', 'Admin']
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (val) => setState(() => selectedRole = val!),
                    ),
                    const SizedBox(height: 25),

                    // Tombol login
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (selectedRole == 'Mahasiswa') {
                            Navigator.pushReplacementNamed(context, '/dashboardMahasiswa');
                          } else if (selectedRole == 'Petugas') {
                            Navigator.pushReplacementNamed(context, '/dashboardPetugas');
                          } else {
                            Navigator.pushReplacementNamed(context, '/dashboardAdmin');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4CAF50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                        ),
                        label: const Text(
                          "Login",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text(
                  "Belum punya akun? Daftar",
                  style: TextStyle(
                    color: Color(0xFF2E7D32),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              
              const SizedBox(height: 30),

              // Footer / teks tambahan
              const Text(
                "©2025 CampusCare",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper biar input seragam dan rapi
  Widget _buildTextField({
    required String label,
    required IconData icon,
    String? hintText,
    bool obscureText = false,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.green.shade700),
        labelText: label,
        hintText: hintText,
        labelStyle: TextStyle(color: Colors.green.shade800, fontWeight: FontWeight.w600),
        filled: true,
        fillColor: const Color(0xFFF1F8E9),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.green.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.green.shade400, width: 1.8),
        ),
      ),
    );
  }
}