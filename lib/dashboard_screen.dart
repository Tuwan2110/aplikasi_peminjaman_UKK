import 'package:flutter/material.dart';
// Import semua halaman yang telah kita buat
import 'form_peminjaman_screen.dart'; 
import 'daftar_alat_screen.dart';
import 'riwayat_peminjaman_screen.dart'; 
import 'profil_screen.dart'; 

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE53935), // Background Merah SMK Brantas
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Beranda',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Selamat Datang',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFFEEEEEE),
              child: Icon(Icons.person_outline, color: Colors.black),
            ),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu),
          ),
        ),
      ),
      
      // --- DRAWER DENGAN NAVIGASI LENGKAP ---
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFE53935)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Color(0xFFE53935)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'SMK Brantas Karangkates',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Teknik Otomotif',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard_outlined, color: Colors.black87),
              title: const Text('Beranda'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.inventory_2_outlined, color: Colors.black87),
              title: const Text('Daftar Alat'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DaftarAlatScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart_outlined, color: Colors.black87),
              title: const Text('Peminjaman'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FormPeminjamanScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.history_outlined, color: Colors.black87),
              title: const Text('Riwayat'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RiwayatPeminjamanScreen()));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person_outline, color: Colors.black87),
              title: const Text('Profil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Keluar', style: TextStyle(color: Colors.red)),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // CARD STATISTIK UTAMA
              _buildStatsCard(context, icon: Icons.inventory, title: '156', subtitle: 'Total Alat', subtext: '+12 Bulan Ini', color: Colors.blue[100]!),
              const SizedBox(height: 16),
              _buildStatsCard(context, icon: Icons.access_time, title: '23', subtitle: 'Sedang di Pinjam', subtext: '14 oleh Anda', color: Colors.yellow[100]!),
              const SizedBox(height: 16),
              _buildStatsCard(context, icon: Icons.check_circle, title: '133', subtitle: 'Alat Tersedia', subtext: '85% ketersediaan', color: Colors.green[100]!),
              const SizedBox(height: 16),
              _buildStatsCard(context, icon: Icons.warning, title: '12', subtitle: 'Alat Rusak', subtext: 'Perlu Perbaikan', color: Colors.red[100]!),
              
              const SizedBox(height: 24),

              // KOTAK PUTIH UTAMA (ALAT POPULER & AKTIVITAS)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Alat Populer', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                        TextButton(onPressed: () {}, child: const Text('Lihat Semua', style: TextStyle(color: Colors.blue))),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildPopularItem('Kunci Pas Set', 'Perkakas Tangan', 8, 10),
                    const Divider(height: 24),
                    _buildPopularItem('Jangka Sorong', 'Alat Ukur', 5, 8),
                    const Divider(height: 24),
                    _buildPopularItem('Multimeter Digital', 'Alat Ukur', 12, 15),
                    
                    const SizedBox(height: 32),

                    Text('Aktivitas Terbaru', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    _buildActivityItem('Peminjaman Bor Listrik', 'Menunggu Persetujuan', '10:45', Colors.orange),
                    const Divider(height: 24),
                    _buildActivityItem('Pengembalian Jangka Sorong', 'Selesai', 'Kemarin', Colors.green),
                    
                    const SizedBox(height: 20),
                    const Center(
                      child: Text('© 2026 SMK Brantas Karangkates', style: TextStyle(fontSize: 10, color: Colors.grey)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET HELPERS ---
  Widget _buildActivityItem(String title, String status, String time, Color statusColor) {
    return Row(
      children: [
        CircleAvatar(radius: 18, backgroundColor: statusColor.withOpacity(0.1), child: Icon(Icons.history, size: 18, color: statusColor)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Text(status, style: TextStyle(fontSize: 12, color: statusColor)),
          ]),
        ),
        Text(time, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }

  Widget _buildStatsCard(BuildContext context, {required IconData icon, required String title, required String subtitle, required String subtext, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]),
      child: Row(children: [
        Container(width: 55, height: 55, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)), child: Icon(icon, size: 28, color: Colors.black87)),
        const SizedBox(width: 16),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          Text(subtext, style: const TextStyle(fontSize: 11, color: Colors.blueGrey)),
        ])),
      ]),
    );
  }

  Widget _buildPopularItem(String name, String category, int available, int total) {
    return Row(children: [
      Container(width: 45, height: 45, decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.build_circle_outlined, color: Colors.grey)),
      const SizedBox(width: 12),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Text(category, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ])),
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text('$available/$total', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
        const Text('Tersedia', style: TextStyle(fontSize: 11, color: Colors.grey)),
      ]),
    ]);
  }
}