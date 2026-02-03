import 'package:flutter/material.dart';

class PetugasReportScreen extends StatelessWidget {
  const PetugasReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan Peminjaman"),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Card(
              child: ListTile(
                leading: Icon(Icons.picture_as_pdf, color: Colors.red),
                title: Text("Download Laporan Bulanan"),
                subtitle: Text("Format: PDF"),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Ringkasan Aktivitas", style: TextStyle(fontWeight: FontWeight.bold)),
            const Divider(),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(title: Text("Total Alat Keluar"), trailing: Text("12")),
                  ListTile(title: Text("Belum Kembali"), trailing: Text("5")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}