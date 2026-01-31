import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEBEE), // Background pink muda halus sesuai desain
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
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
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // ================= HEADER PROFIL MERAH =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: const Color(0xFFE53935),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Text('A', style: TextStyle(fontSize: 35, color: Color(0xFFE53935), fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 15),
                  const Text('Ahmad Rizki', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  const Text('4354 - TKR 1', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  const Text('Siswa', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      minimumSize: const Size(120, 35),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Keluar', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // ================= STATISTIK CARDS (3 BARIS) =================
            _buildStatItem('15', 'Total Peminjaman', Icons.military_tech, Colors.red.shade100, Colors.red),
            const SizedBox(height: 10),
            _buildStatItem('2', 'Sedang Dipinjam', Icons.inventory_2, Colors.yellow.shade200, Colors.orange),
            const SizedBox(height: 10),
            _buildStatItem('13', 'Tepat Waktu', Icons.lightbulb, Colors.green.shade100, Colors.green),
            const SizedBox(height: 20),

            // ================= INFORMASI PRIBADI BOX =================
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.red.shade50),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Informasi Pribadi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  _buildInfoRow(Icons.person, 'Nama Lengkap', 'Ahmad Rizki', Colors.red.shade100, Colors.red),
                  _buildInfoRow(Icons.badge, 'NISN', '4354', Colors.purple.shade100, Colors.purple),
                  _buildInfoRow(Icons.email, 'Email', 'ahmad.rizki@smk.sch.id', Colors.green.shade100, Colors.green),
                  _buildInfoRow(Icons.phone, 'Telepon', '081234567890', Colors.yellow.shade200, Colors.orange),
                  _buildInfoRow(Icons.location_on, 'Lokasi', 'Jl. Pendidikan No. 123, Jakarta', Colors.blue.shade100, Colors.blue),
                  _buildInfoRow(Icons.calendar_today, 'Tanggal Gabung', '1 Juli 2022', Colors.red.shade100, Colors.red),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // ================= PENGATURAN AKUN BOX =================
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.red.shade50),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Pengaturan Akun', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  _buildSettingItem('Ubah Password', 'Terakhir diubah 30 hari lalu'),
                  _buildSettingItem('Notifikasi', 'Kelola preferensi notifikasi'),
                  _buildSettingItem('Privasi dan Keamanan', 'Atur preferensi privasi'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk List Statistik di bagian atas
  Widget _buildStatItem(String value, String label, IconData icon, Color bgColor, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.red.shade50),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }

  // Widget untuk baris informasi pribadi
  Widget _buildInfoRow(IconData icon, String label, String value, Color bgColor, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
              Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
    );
  }

  // Widget untuk menu pengaturan akun
  Widget _buildSettingItem(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }
}