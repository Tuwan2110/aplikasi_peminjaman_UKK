import 'package:flutter/material.dart';
import 'package:aplikasi_peminjaman/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peminjaman Alat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nimNipController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RoleSelectionScreen(id: _nimNipController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryRed = Color(0xFFE53935);

    return Scaffold(
      backgroundColor: primaryRed,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFB71C1C),
                  child: Icon(Icons.build, size: 40, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text('Peminjaman Alat', 
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                const Text('Teknik Otomotif', 
                  style: TextStyle(fontSize: 14, color: Colors.white70)),
                const SizedBox(height: 40), // Jarak ke kotak putih
                Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      )
                    ]
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Login', 
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 25),
                        
                        // Kolom NIM/NIP
                        const Text('NIM/NIP', 
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                        const SizedBox(height: 8), // Jarak teks ke kolom
                        TextFormField(
                          controller: _nimNipController,
                          decoration: InputDecoration(
                            hintText: 'Masukkan NIM/NIP',
                            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                            prefixIcon: const Icon(Icons.person_outline, size: 20),
                            contentPadding: const EdgeInsets.symmetric(vertical: 15),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        
                        const SizedBox(height: 20), // Jarak antar input
                        
                        // Kolom Kata Sandi
                        const Text('Kata Sandi', 
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                        const SizedBox(height: 8), // Jarak teks ke kolom
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Masukkan Kata Sandi',
                            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                            prefixIcon: const Icon(Icons.lock_outline, size: 20),
                            contentPadding: const EdgeInsets.symmetric(vertical: 15),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        
                        const SizedBox(height: 35), // Jarak ke tombol
                        
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryRed,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              elevation: 2,
                            ),
                            child: const Text('Masuk', 
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoleSelectionScreen extends StatelessWidget {
  final String id;
  const RoleSelectionScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFE53935);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFFB71C1C),
              child: Icon(Icons.build, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text('Peminjaman Alat', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            const Text('Teknik Otomotif', style: TextStyle(fontSize: 14, color: Colors.white70)),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.black54),
                        label: const Text('Kembali', style: TextStyle(color: Colors.black54)),
                      ),
                    ),
                    const Text('Pilih Role Anda', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Masuk Sebagai : $id', style: TextStyle(color: Colors.grey[600])),
                    const SizedBox(height: 25),
                    
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildRoleCard(context, 'Admin', 'Kelola sistem, alat dan pengguna', bgColor, Icons.shield_outlined),
                            _buildRoleCard(context, 'Peminjam', 'Pinjam dan kembalikan alat', const Color(0xFF3D5AFE), Icons.people_outline),
                            _buildRoleCard(context, 'Petugas', 'Kelola peminjaman dan pengembalian', const Color(0xFF1B5E20), Icons.group_add_outlined),
                            const SizedBox(height: 30),
                            const Text('2026 SMK Brantas Karangkates - Teknik Otomotif', 
                              style: TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.w500)),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleCard(BuildContext context, String title, String subtitle, Color color, IconData icon) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen())),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ]
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}