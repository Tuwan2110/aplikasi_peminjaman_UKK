import 'package:flutter/material.dart';
import 'main.dart'; 
import 'admin_manage_user.dart'; // <--- Pastikan file ini sudah Mas buat
import 'daftar_alat_screen.dart';
import 'profil_screen.dart';
import 'form_peminjaman_screen.dart';
import 'riwayat_peminjaman_screen.dart';

class DashboardScreen extends StatefulWidget {
  final String role;
  final String username;

  const DashboardScreen({
    super.key, 
    required this.role, 
    required this.username,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('Selamat datang, ${widget.username} (${widget.role})', 
                 style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
          const CircleAvatar(
            radius: 15,
            backgroundColor: Colors.blue,
            child: Text('A', style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
          const SizedBox(width: 12),
        ],
      ),
      drawer: _buildRoleDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: _buildBodyByRole(),
      ),
    );
  }

  Widget _buildBodyByRole() {
    if (widget.role == 'Admin') {
      return _buildAdminContent();
    } else if (widget.role == 'Petugas') {
      return _buildPetugasContent();
    } else {
      return _buildPeminjamContent();
    }
  }

  // --- TAMPILAN CONTENT (Tetap Sama Seperti Punya Mas) ---
  Widget _buildAdminContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMainHeader("Dashboard Admin", "Kelola seluruh sistem peminjaman alat"),
        const SizedBox(height: 20),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: [
            _buildStatCard("Total User", "4", Icons.people_outline, Colors.blue),
            _buildStatCard("Total Alat", "5", Icons.inventory_2_outlined, Colors.green),
            _buildStatCard("Kategori", "5", Icons.category_outlined, Colors.purple),
            _buildStatCard("Total Peminjaman", "2", Icons.assignment_outlined, Colors.orange),
          ],
        ),
      ],
    );
  }

  Widget _buildPetugasContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMainHeader("Dashboard Petugas", "Kelola persetujuan dan monitoring peminjaman"),
        const SizedBox(height: 20),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: [
            _buildStatCard("Menunggu Approval", "0", Icons.access_time, Colors.amber),
            _buildStatCard("Disetujui", "2", Icons.check_circle_outline, Colors.green),
            _buildStatCard("Ditolak", "0", Icons.cancel_outlined, Colors.red),
            _buildStatCard("Dikembalikan", "0", Icons.assignment_return_outlined, Colors.blue),
          ],
        ),
      ],
    );
  }

  Widget _buildPeminjamContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.3,
          children: [
            _buildStatCardDetail("Total Alat", "156", "+12 bulan ini", Icons.inventory_2, Colors.blue),
            _buildStatCardDetail("Sedang Dipinjam", "23", "14 oleh Anda", Icons.access_time, Colors.orange),
            _buildStatCardDetail("Alat Tersedia", "133", "85% ketersediaan", Icons.check_circle, Colors.green),
            _buildStatCardDetail("Perlu Perhatian", "5", "Segera dikembalikan", Icons.report_problem, Colors.red),
          ],
        ),
        const SizedBox(height: 20),
        const Text("Alat Populer", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const Divider(),
        _buildToolItem("Kunci Pas Set", "Perkakas Tangan", "8/10 Tersedia"),
        _buildToolItem("Jangka Sorong", "Alat Ukur", "3/5 Tersedia"),
      ],
    );
  }

  // --- REUSABLE WIDGETS ---
  Widget _buildMainHeader(String title, String subtitle) {
    return Container(
      width: double.infinity, padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200), borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(subtitle, style: const TextStyle(color: Colors.grey)),
      ]),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade100)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(icon, color: color, size: 28),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        ])
      ]),
    );
  }

  Widget _buildStatCardDetail(String label, String value, String sub, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade100)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(padding: const EdgeInsets.all(6), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)), child: Icon(icon, color: Colors.white, size: 20)),
        const Spacer(),
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.black87)),
        Text(sub, style: const TextStyle(fontSize: 9, color: Colors.grey)),
      ]),
    );
  }

  Widget _buildToolItem(String name, String cat, String qty) {
    return ListTile(
      leading: const Icon(Icons.build_circle_outlined),
      title: Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      subtitle: Text(cat, style: const TextStyle(fontSize: 12)),
      trailing: Text(qty, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }

  // --- DRAWER DYNAMIC DENGAN FUNGSI NAVIGASI ---
  Widget _buildRoleDrawer() {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            accountName: Text(widget.username, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            accountEmail: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(10)),
              child: Text(widget.role, style: const TextStyle(color: Colors.red, fontSize: 10)),
            ),
            currentAccountPicture: const CircleAvatar(backgroundColor: Colors.red, child: Icon(Icons.inventory_2, color: Colors.white)),
          ),
          
          // Menu Admin
          if (widget.role == 'Admin') ...[
            _drawerItem(Icons.dashboard, "Dashboard", true, onTap: () => Navigator.pop(context)),
            _drawerItem(Icons.people_alt_outlined, "Manajemen User", false, onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminManageUserScreen()));
            }),
            _drawerItem(Icons.inventory_2_outlined, "Manajemen Alat", false, onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const DaftarAlatScreen()));
            }),
            _drawerItem(Icons.person_outline, "Profil", false, onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilScreen()));
            }),
          ],
          
          // Menu Petugas
          if (widget.role == 'Petugas') ...[
            _drawerItem(Icons.dashboard, "Dashboard", true, onTap: () => Navigator.pop(context)),
            _drawerItem(Icons.check_circle_outline, "Setujui Peminjaman", false, onTap: () {}),
            _drawerItem(Icons.person_outline, "Profil", false, onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilScreen()));
            }),
          ],
          
          // Menu Peminjam
          if (widget.role == 'Peminjam') ...[
            _drawerItem(Icons.home_outlined, "Beranda", true, onTap: () => Navigator.pop(context)),
            _drawerItem(Icons.grid_view, "Katalog Alat", false, onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const DaftarAlatScreen()));
            }),
            _drawerItem(Icons.add_box_outlined, "Ajukan Peminjaman", false, onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const FormPeminjamanScreen()));
            }),
            _drawerItem(Icons.history, "Riwayat", false, onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const RiwayatPeminjamanScreen()));
            }),
            _drawerItem(Icons.person_outline, "Profil", false, onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilScreen()));
            }),
          ],
          const Spacer(),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen())),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Fungsi pembantu untuk item drawer
  Widget _drawerItem(IconData icon, String title, bool isSelected, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.red : Colors.grey),
      title: Text(title, style: TextStyle(color: isSelected ? Colors.red : Colors.black87, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
      selected: isSelected,
      onTap: onTap, // Menambahkan fungsi klik di sini
    );
  }
}