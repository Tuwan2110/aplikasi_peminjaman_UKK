import 'package:flutter/material.dart';
import 'main.dart'; // Penting untuk akses variabel 'supabase'

class AdminManageUserScreen extends StatefulWidget {
  const AdminManageUserScreen({super.key});

  @override
  State<AdminManageUserScreen> createState() => _AdminManageUserScreenState();
}

class _AdminManageUserScreenState extends State<AdminManageUserScreen> {
  // Fungsi ambil data dari Supabase
  Future<List<Map<String, dynamic>>> _fetchUsers() async {
    try {
      final response = await supabase.from('users').select().order('username');
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      debugPrint("Error detail: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Background abu-abu muda halus
      appBar: AppBar(
        title: const Text("Manajemen User", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          final users = snapshot.data ?? [];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // ================= HEADER BOX (FOTO ATAS) =================
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.blue.shade100,
                            child: const Icon(Icons.group, color: Colors.blue, size: 30),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Manajemen User", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text("${users.length} user terdaftar", style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text("Tambah User"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade600,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // ================= SEARCH & FILTER (FOTO TENGAH) =================
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Cari user...",
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
                          contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const Icon(Icons.filter_list, color: Colors.grey),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: "Semua Role",
                                items: ["Semua Role", "Admin", "Petugas", "Peminjam"].map((String value) {
                                  return DropdownMenuItem<String>(value: value, child: Text(value));
                                }).toList(),
                                onChanged: (val) {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // ================= TABEL DATA (FOTO BAWAH) =================
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    children: [
                      // Header Tabel
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                        ),
                        child: const Row(
                          children: [
                            Expanded(flex: 3, child: Text("USER", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.blueGrey))),
                            Expanded(flex: 2, child: Text("NIM/NIP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.blueGrey))),
                            Expanded(flex: 2, child: Text("KONTAK", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.blueGrey))),
                          ],
                        ),
                      ),
                      // List User
                      users.isEmpty 
                        ? const Padding(padding: EdgeInsets.all(20), child: Text("Tidak ada data"))
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: users.length,
                            separatorBuilder: (context, index) => const Divider(height: 1),
                            itemBuilder: (context, index) {
                              final u = users[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Colors.blue.shade600,
                                            child: Text(u['username'][0].toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 12)),
                                          ),
                                          const SizedBox(width: 12),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(u['username'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                              Text(u['email'] ?? "-", style: const TextStyle(fontSize: 11, color: Colors.grey)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(flex: 2, child: Text(u['nim'] ?? "202100${index+1}", style: const TextStyle(fontSize: 13))),
                                    Expanded(flex: 2, child: Text(u['telepon'] ?? "081234567", style: const TextStyle(fontSize: 13))),
                                  ],
                                ),
                              );
                            },
                          ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}