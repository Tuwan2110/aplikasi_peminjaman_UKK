class KategoriModel {
  final int id;
  final String namaKategori;

  KategoriModel({
    required this.id,
    required this.namaKategori,
  });

  // Fungsi untuk mengubah data dari Supabase (Map) ke Object Flutter
  factory KategoriModel.fromJson(Map<String, dynamic> json) {
    return KategoriModel(
      id: json['id'],
      namaKategori: json['nama_kategori'],
    );
  }

  // Fungsi untuk mengubah Object Flutter ke Map (untuk Simpan/Update ke Supabase)
  Map<String, dynamic> toJson() {
    return {
      'nama_kategori': namaKategori,
    };
  }
}