class UserModel {
  final String id;
  final String namaLengkap;
  final String role; // Admin, Petugas, Peminjam
  final String? nisn;

  UserModel({
    required this.id,
    required this.namaLengkap,
    required this.role,
    this.nisn,
  });

  // Untuk mengambil data dari Supabase
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      namaLengkap: json['nama_lengkap'],
      role: json['role'],
      nisn: json['nisn'],
    );
  }
}