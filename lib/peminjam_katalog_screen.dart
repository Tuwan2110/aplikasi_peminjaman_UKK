import 'package:flutter/material.dart';

class PeminjamKatalogScreen extends StatelessWidget {
  const PeminjamKatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Katalog Alat"), backgroundColor: Colors.blue),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue.shade50,
            child: const Center(child: Text("Gambar Alat\n(Tugas: Lihat Alat)")),
          );
        },
      ),
    );
  }
}