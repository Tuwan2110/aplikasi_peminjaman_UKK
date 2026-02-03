import 'package:flutter/material.dart';
import 'main.dart'; 

class AdminManageAlatScreen extends StatefulWidget {
  const AdminManageAlatScreen({super.key});

  @override
  State<AdminManageAlatScreen> createState() => _AdminManageAlatScreenState();
}

class _AdminManageAlatScreenState extends State<AdminManageAlatScreen> {
  // Fungsi ambil data alat
  Future<List<Map<String, dynamic>>> _fetchAlat() async {
    final response = await supabase.from('alat').select();
    return List<Map<String, dynamic>>.from(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kelola Alat Bengkel"),
        backgroundColor: Colors.red.shade700,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchAlat(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                leading: const Icon(Icons.build, color: Colors.red),
                title: Text(data[index]['nama_alat']),
                subtitle: Text("Stok: ${data[index]['stok']}"),
                trailing: const Icon(Icons.edit, color: Colors.grey),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Membuka Form Tambah Alat...")));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}