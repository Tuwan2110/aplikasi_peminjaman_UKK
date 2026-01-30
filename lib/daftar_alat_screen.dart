import 'package:flutter/material.dart';
import 'form_peminjaman_screen.dart';

class DaftarAlatScreen extends StatelessWidget {
  const DaftarAlatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE53935),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        title: const Text(
          'Daftar Alat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildItemCard(
            context,
            nama: 'Kunci Momen',
            tersedia: '5/5',
            kondisi: 'Baik',
            lokasi: 'Lemari A',
          ),
          _buildItemCard(
            context,
            nama: 'Jangka Sorong',
            tersedia: '8/10',
            kondisi: 'Baik',
            lokasi: 'Lemari B',
          ),
          _buildItemCard(
            context,
            nama: 'Multimeter',
            tersedia: '3/4',
            kondisi: 'Baik',
            lokasi: 'Lemari C',
          ),
        ],
      ),
    );
  }

  Widget _buildItemCard(
    BuildContext context, {
    required String nama,
    required String tersedia,
    required String kondisi,
    required String lokasi,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nama,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Tersedia: $tersedia',
            style: const TextStyle(fontSize: 13),
          ),
          Text(
            'Kondisi: $kondisi',
            style: const TextStyle(fontSize: 13),
          ),
          Text(
            'Lokasi: $lokasi',
            style: const TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FormPeminjamanScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE53935),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Pinjam Alat',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
