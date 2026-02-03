import 'package:flutter/material.dart';

class AdminManageKategoriScreen extends StatelessWidget {
  const AdminManageKategoriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manajemen Kategori"), 
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text("Tugas Admin: Menambah/Hapus Kategori Barang"),
      ),
    );
  }
}