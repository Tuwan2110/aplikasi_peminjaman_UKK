import 'package:flutter/material.dart';
import 'models/alat_model.dart';

class DaftarAlatScreen extends StatefulWidget {
  const DaftarAlatScreen({super.key});

  @override
  State<DaftarAlatScreen> createState() => _DaftarAlatScreenState();
}

class _DaftarAlatScreenState extends State<DaftarAlatScreen> {
  // Data dummy alat bengkel
  List<AlatModel> daftarAlat = [
    AlatModel(
      id: 1,
      nama: "Kunci Pas Set (8-32mm)",
      kategori: "Perkakas Tangan",
      jumlah: 10,
      tersedia: 8,
      kondisi: "Baik",
      lokasi: "Rak A1",
    ),
    AlatModel(
      id: 2,
      nama: "Obeng Set (+/-)",
      kategori: "Perkakas Tangan",
      jumlah: 20,
      tersedia: 15,
      kondisi: "Baik",
      lokasi: "Rak B2",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna merah khas SMK Brantas
      backgroundColor: const Color(0xFFE53935),
      appBar: AppBar(
        title: const Text(
          "Katalog Alat",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: daftarAlat.length,
        itemBuilder: (context, index) {
          final alat = daftarAlat[index];
          return _buildCardAlat(alat);
        },
      ),
    );
  }

  // WIDGET CARD UTAMA (Tampilan di Daftar)
  Widget _buildCardAlat(AlatModel alat) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    alat.nama,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Tersedia",
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              alat.kategori,
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
          ),
          const Divider(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSmallInfo("Ketersediaan", "${alat.tersedia}/${alat.jumlah}"),
                _buildSmallInfo("Kondisi", alat.kondisi),
                _buildSmallInfo("Lokasi", alat.lokasi),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE53935),
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
                elevation: 0,
              ),
              onPressed: () => _showDetailAlat(context, alat), // Panggil Pop-up
              child: const Text(
                "Pinjam Alat",
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
            ),
          )
        ],
      ),
    );
  }

  // FUNGSI POP-UP DETAIL ALAT (SESUAI FOTO)
  void _showDetailAlat(BuildContext context, AlatModel alat) {
    int jumlahPinjam = 1;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setPopupState) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Detail Alat",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  
                  // Baris Informasi
                  _buildDetailRow(Icons.build_circle_outlined, alat.nama, Colors.blue),
                  _buildDetailRow(Icons.location_on_outlined, "Lokasi: ${alat.lokasi}", Colors.black54),
                  _buildDetailRow(Icons.info_outline, "Gunakan alat sesuai dengan SOP bengkel SMK Brantas.", Colors.black54),
                  _buildDetailRow(Icons.check_circle_outline, "Kondisi Alat: ${alat.kondisi}", Colors.black54),
                  _buildDetailRow(Icons.inventory_2_outlined, "Stok Tersedia: ${alat.tersedia} Unit", Colors.black54),
                  _buildDetailRow(Icons.qr_code_scanner, "Kode Alat: ALT-0${alat.id}", Colors.black54),

                  const SizedBox(height: 25),

                  // Pengatur Jumlah
                  Row(
                    children: [
                      const Text("Jumlah Pinjam:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                              onPressed: () {
                                if (jumlahPinjam > 1) {
                                  setPopupState(() => jumlahPinjam--);
                                }
                              },
                            ),
                            Text(
                              "$jumlahPinjam",
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline, color: Colors.blue),
                              onPressed: () {
                                if (jumlahPinjam < alat.tersedia) {
                                  setPopupState(() => jumlahPinjam++);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Tombol Konfirmasi (Telah Diperbaiki: Navigator Form Dihapus)
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      onPressed: () {
                        // 1. Tutup pop-up
                        Navigator.pop(context);
                        
                        // 2. Tampilkan notifikasi sukses
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${alat.nama} ($jumlahPinjam) masuk keranjang"),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      child: const Text(
                        "Tambah ke Keranjang",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // WIDGET KECIL UNTUK INFO BARIS
  Widget _buildDetailRow(IconData icon, String text, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22, color: iconColor),
          const SizedBox(width: 15),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
  
  Widget _buildSmallInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
      ],
    );
  }
}