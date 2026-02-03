import 'package:flutter/material.dart';

class PeminjamFormScreen extends StatefulWidget {
  const PeminjamFormScreen({super.key});

  @override
  State<PeminjamFormScreen> createState() => _PeminjamFormScreenState();
}

class _PeminjamFormScreenState extends State<PeminjamFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Pinjam Alat"),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: "Nama Alat")),
            const SizedBox(height: 10),
            const TextField(decoration: InputDecoration(labelText: "Lama Pinjam (Hari)")),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Permintaan Terkirim ke Petugas!")));
              },
              child: const Text("Ajukan Sekarang"),
            )
          ],
        ),
      ),
    );
  }
}