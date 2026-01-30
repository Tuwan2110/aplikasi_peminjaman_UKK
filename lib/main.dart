import 'package:aplikasi_peminjaman/dashboard_screen.dart';
import 'package:flutter/material.dart';

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
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white, // background form putih
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

  bool _rememberMe = false; // ✅ Ini HARUS boolean, bukan bool?

  void _login() {
  if (_formKey.currentState!.validate()) {
    // Simulasi login berhasil → pindah ke Dashboard
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE53935),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.build,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),

                Text('Peminjaman Alat', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 4),
                Text('Teknik Otomotif', style: TextStyle(fontSize: 16, color: Colors.white70)),
                const SizedBox(height: 32),

                // Form
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 4)),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nimNipController,
                          decoration: InputDecoration(
                            labelText: 'Masukkan NIM/NIP',
                            prefixIcon: Icon(Icons.person_outline),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => value?.trim().isEmpty ?? true ? 'Harap masukkan NIM/NIP' : null,
                        ),
                        const SizedBox(height: 16),

                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Masukkan Kata Sandi',
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => value?.trim().isEmpty ?? true ? 'Kata sandi tidak boleh kosong' : null,
                        ),
                        const SizedBox(height: 16),

                        // ✅ PERBAIKAN UTAMA DI SINI:
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe, // Sekarang pasti bool, bukan null
                              onChanged: (bool? value) {
                                setState(() {
                                  _rememberMe = value ?? false; // aman dari null
                                });
                              },
                            ),
                            const Text('Ingat Saya'),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Fitur lupa kata sandi belum tersedia')),
                                );
                              },
                              child: const Text('Lupa Kata Sandi?', style: TextStyle(color: Colors.blue)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE53935),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text('Masuk', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
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