import 'package:flutter/material.dart';
import 'main.dart'; // Import ini supaya bisa pakai variabel 'supabase'

class AdminManageUserScreen extends StatefulWidget {
  const AdminManageUserScreen({super.key});

  @override
  State<AdminManageUserScreen> createState() => _AdminManageUserScreenState();
}

class _AdminManageUserScreenState extends State<AdminManageUserScreen> {
  // Fungsi untuk mengambil data (READ)
  Future<List<Map<String, dynamic>>> _fetchUsers() async {
    return await supabase.from('users').select();
  }

  // Fungsi untuk menghapus data (DELETE)
  Future<void> _deleteUser(String id) async {
    await supabase.from('users').delete().match({'id': id});
    setState(() {}); // Refresh tampilan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manajemen User"),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: _fetchUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          
          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(user['username'] ?? 'No Name'),
                subtitle: Text("Role: ${user['role']}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteUser(user['id'].toString()),
                ),
              );
            },
          );
        },
      ),
      // Tombol Tambah (CREATE)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Nanti di sini panggil fungsi Tambah User
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}