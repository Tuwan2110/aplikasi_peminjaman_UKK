import 'package:flutter/material.dart';

class FormPeminjamanScreen extends StatelessWidget {
  const FormPeminjamanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background merah khas SMK Brantas
      backgroundColor: const Color(0xFFE53935),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Form Peminjaman',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // ================= KOTAK FORM PUTIH =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Form
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.assignment_outlined, color: Color(0xFFE53935)),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Data Peminjaman',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Teknik Otomotif',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Divider(thickness: 1),
                  const SizedBox(height: 20),

                  // Input Fields
                  _buildLabel('Pilih Alat Bengkel'),
                  _buildDropdownField('Cari alat (misal: Kunci Momen)'),
                  
                  const SizedBox(height: 20),
                  
                  _buildLabel('Jumlah Alat'),
                  _buildTextField('Contoh: 2', TextInputType.number, Icons.numbers),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('Tanggal Pinjam'),
                            _buildDateField('12/03/2026'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('Estimasi Kembali'),
                            _buildDateField('14/03/2026'),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  _buildLabel('Keperluan / Tujuan'),
                  _buildTextArea('Contoh: Praktek Overhaul Mesin di Bengkel C'),
                  
                  const SizedBox(height: 10),
                  const Text(
                    '* Pastikan alat dikembalikan dalam keadaan bersih',
                    style: TextStyle(fontSize: 10, color: Colors.red, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ================= TOMBOL AKSI =================
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 2),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Reset', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      elevation: 5,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Ajukan Peminjaman', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ================= STYLE COMPONENT (BIAR MIRIP FIGMA) =================

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 11,
          color: Colors.black87,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextInputType type, IconData icon) {
    return TextField(
      keyboardType: type,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, size: 20, color: Colors.grey),
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildDropdownField(String hint) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(hint, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          icon: const Icon(Icons.keyboard_arrow_down),
          items: const [],
          onChanged: (val) {},
        ),
      ),
    );
  }

  Widget _buildDateField(String date) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(date, style: const TextStyle(fontSize: 14, color: Colors.black87)),
          const Icon(Icons.calendar_month_outlined, size: 20, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildTextArea(String hint) {
    return TextField(
      maxLines: 3,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}