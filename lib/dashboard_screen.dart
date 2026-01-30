import 'package:flutter/material.dart';
import 'daftar_alat_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE53935), // Merah background
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Beranda', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const Text('Selamat Datang', style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_outline)),
        ],
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFE53935)),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(title: const Text('Dashboard'), onTap: () => Navigator.pop(context)),
            ListTile(title: const Text('Daftar Alat'), onTap: () => DaftarAlatScreen),
            ListTile(title: const Text('Riwayat Peminjaman'), onTap: () => Navigator.pop(context)),
            ListTile(title: const Text('Profil'), onTap: () => Navigator.pop(context)),
            ListTile(title: const Text('Keluar'), onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Statistik Cards
              _buildStatsCard(
                context,
                icon: Icons.inventory,
                title: '156',
                subtitle: 'Total Alat',
                subtext: '+12 Bulan Ini',
                color: Colors.blue[200]!,
              ),
              const SizedBox(height: 16),
              _buildStatsCard(
                context,
                icon: Icons.access_time,
                title: '23',
                subtitle: 'Sedang di Pinjam',
                subtext: '14 oleh Anda',
                color: Colors.yellow[200]!,
              ),
              const SizedBox(height: 16),
              _buildStatsCard(
                context,
                icon: Icons.check_circle,
                title: '133',
                subtitle: 'Alat Tersedia',
                subtext: '85% ketersediaan',
                color: Colors.green[200]!,
              ),
              const SizedBox(height: 16),
              _buildStatsCard(
                context,
                icon: Icons.warning,
                title: '133',
                subtitle: 'Alat Tersedia',
                subtext: '85% ketersediaan',
                color: Colors.red[200]!,
              ),
              const SizedBox(height: 32),

              // Alat Populer
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
                        TextButton(
                          onPressed: () {},
                          child: Text('Lihat Semua', style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildPopularItem('Kunci Pas Set', 'Perkakas Tangan', 8, 10),
                    const Divider(height: 24),
                    _buildPopularItem('Jangka Sorong', 'Alat Ukur', 5, 8),
                    const Divider(height: 24),
                    _buildPopularItem('Multimeter Digital', 'Alat Ukur', 12, 15),
                    const Divider(height: 24),
                    _buildPopularItem('Bor Listrik', 'Perkakas Listrik', 3, 5),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Aktivitas Terbaru
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Aktivitas Terbaru', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    ...List.generate(4, (index) => _buildActivityItem()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String subtext,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 32, color: Colors.black),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                Text(subtext, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularItem(String name, String category, int available, int total) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(Icons.build, size: 20, color: Colors.grey[700]),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(category, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('$available/$total', style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('Tersedia', style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _buildActivityItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Peminjaman', style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Jangka Sorong', style: const TextStyle(fontSize: 14)),
                Text('Budi Santoso', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Text('1 Jam Lalu', style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          Icon(Icons.check_circle, color: Colors.green, size: 24),
        ],
      ),
    );
  }
}