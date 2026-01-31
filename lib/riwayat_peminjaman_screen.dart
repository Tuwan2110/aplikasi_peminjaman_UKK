import 'package:flutter/material.dart';

class RiwayatPeminjamanScreen extends StatelessWidget {
  const RiwayatPeminjamanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE53935), // Background merah khas
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: const Icon(Icons.menu),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Beranda', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('Selamat Datang', style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          const CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xFFEEEEEE),
            child: Icon(Icons.person_outline, color: Colors.black, size: 20),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // ================= HEADER TITLE BOX =================
            _buildHeaderBox(),
            const SizedBox(height: 15),

            // ================= STATISTIC GRID (4 KOTAK) =================
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildStatCard('5', 'Total Peminjaman', Colors.blue),
                      const SizedBox(width: 10),
                      _buildStatCard('2', 'Sedang di pinjam', Colors.amber),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildStatCard('1', 'Dikembalikan', Colors.green),
                      const SizedBox(width: 10),
                      _buildStatCard('1', 'Terlambat', Colors.red),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // ================= SEARCH & FILTER SECTION =================
            _buildFilterSection(),
            const SizedBox(height: 15),

            // ================= LIST RIWAYAT CARDS =================
            _buildRiwayatCard(
              id: 'PJM-001',
              status: 'Dikembalikan',
              statusColor: Colors.green,
              items: ['Kunci pas set', 'Obeng plus set'],
              tglPinjam: '10/12/2025',
              tglKembali: '20/12/2025',
              tglDikembalikan: '15/12/2025',
              tujuan: 'Praktikum Engine Overhaul',
              disetujui: 'Pak Budi',
            ),
            const SizedBox(height: 15),
            _buildRiwayatCard(
              id: 'PJM-002',
              status: 'Dipinjam',
              statusColor: Colors.amber,
              items: ['Kunci pas set', 'Palu plastik'],
              tglPinjam: '15/01/2026',
              tglKembali: '20/01/2026',
              tglDikembalikan: '-',
              tujuan: 'Praktikum Engine Overhaul',
              disetujui: 'Pak Budi',
            ),
          ],
        ),
      ),
    );
  }

  // --- Widget Box Judul Atas ---
  Widget _buildHeaderBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Riwayat Peminjaman', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text('Lihat semua riwayat peminjaman alat Anda', style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  // --- Widget Kotak Statistik ---
  Widget _buildStatCard(String value, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red.shade100),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  // --- Widget Filter ---
  Widget _buildFilterSection() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Sedang di Pinjam...',
              prefixIcon: const Icon(Icons.search, size: 20),
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildFilterChip('Semua', true),
              _buildFilterChip('Menunggu', false),
              _buildFilterChip('Disetujui', false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.red : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontSize: 12)),
    );
  }

  // --- Widget Item Kartu Riwayat ---
  Widget _buildRiwayatCard({
    required String id,
    required String status,
    required Color statusColor,
    required List<String> items,
    required String tglPinjam,
    required String tglKembali,
    required String tglDikembalikan,
    required String tujuan,
    required String disetujui,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ID : $id', style: const TextStyle(fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(status, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text('Alat yang Dipinjam :', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          Wrap(
            spacing: 5,
            children: items.map((item) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(5)),
              child: Text(item, style: const TextStyle(fontSize: 10, color: Colors.red)),
            )).toList(),
          ),
          const SizedBox(height: 15),
          _buildDetailRow('Tanggal Pinjam', tglPinjam),
          _buildDetailRow('Tanggal Kembali', tglKembali),
          _buildDetailRow('Dikembalikan', tglDikembalikan),
          _buildDetailRow('Tujuan', tujuan),
          _buildDetailRow('Disetujui Oleh', disetujui),
          const SizedBox(height: 15),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade200,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Detail', style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          Text(value, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}