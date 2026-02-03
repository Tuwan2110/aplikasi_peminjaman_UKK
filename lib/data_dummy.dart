import 'models/alat_model.dart';

class DataDummy {
  static List<AlatModel> listAlat = [
    AlatModel(
      id: 1,
      nama: "Bor Listrik",
      kategori: "Perkakas",
      jumlah: 5,
      tersedia: 3,
      kondisi: "Baik",
      lokasi: "Rak A",
    ),

    AlatModel(
      id: 2,
      nama: "Kunci Pas",
      kategori: "Perkakas",
      jumlah: 10,
      tersedia: 7,
      kondisi: "Baik",
      lokasi: "Rak B",
    ),
  ];
}
