class PeminjamanModel {
  final String id;
  final String namaAlat;
  final String namaPeminjam;
  final String tanggalPinjam;
  final String status; // Menunggu, Disetujui, Selesai

  PeminjamanModel({
    required this.id,
    required this.namaAlat,
    required this.namaPeminjam,
    required this.tanggalPinjam,
    required this.status,
  });

  factory PeminjamanModel.fromJson(Map<String, dynamic> json) {
    return PeminjamanModel(
      id: json['id_pinjam'] ?? '',
      namaAlat: json['nama_alat'] ?? '',
      namaPeminjam: json['nama_siswa'] ?? '',
      tanggalPinjam: json['tanggal_pinjam'] ?? '',
      status: json['status_pinjam'] ?? '',
    );
  }
}