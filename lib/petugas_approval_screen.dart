import 'package:flutter/material.dart';

class PetugasApprovalScreen extends StatelessWidget {
  const PetugasApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Persetujuan Pinjaman"), backgroundColor: Colors.green),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Tugas Petugas: Klik SETUJU jika siswa ingin pinjam alat.", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text("Peminjaman: Kunci Pas - Budi"),
                  subtitle: const Text("Status: Menunggu Persetujuan"),
                  trailing: ElevatedButton(onPressed: () {}, child: const Text("SETUJU")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}