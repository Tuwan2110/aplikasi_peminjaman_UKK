import 'package:flutter/material.dart';

class FormPeminjamanScreen extends StatelessWidget {
  const FormPeminjamanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE53935),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text('Peminjaman Alat', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Bagian Form Utama
            _buildWhiteBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Form Peminjaman Alat', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Text('Lengkapi data untuk meminjam', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const Divider(height: 30),
                  
                  _buildLabel('Pilih Alat'),
                  _buildDropdownField('Pilih Alat Teknik Otomotif...'),
                  
                  const SizedBox(height: 15),
                  _buildLabel('Jumlah'),
                  _buildTextField('Masukkan jumlah alat...', TextInputType.number),
                  
                  const SizedBox(height: 15),
                  _buildLabel('Tanggal Pinjam'),
                  _buildDateField('Pilih Tanggal Pinjam'),
                  
                  const SizedBox(height: 15),
                  _buildLabel('Tanggal Kembali'),
                  _buildDateField('Pilih Tanggal Kembali'),
                  
                  const SizedBox(height: 15),
                  _buildLabel('Tujuan Peminjaman'),
                  _buildTextArea('Contoh: Praktek mesin diesel di bengkel...'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Tombol Aksi
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text('Reset'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text('Kirim Pengajuan'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Fungsi Helper Desain
  Widget _buildWhiteBox({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }

  Widget _buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
  );

  Widget _buildTextField(String hint, [TextInputType? type]) {
    return TextField(
      keyboardType: type,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildDropdownField(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(hint: Text(hint), isExpanded: true, items: const [], onChanged: (val) {}),
      ),
    );
  }

  Widget _buildDateField(String hint) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(hint, style: const TextStyle(color: Colors.grey)), const Icon(Icons.calendar_today, size: 18)],
      ),
    );
  }

  Widget _buildTextArea(String hint) {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      ),
    );
  }
}