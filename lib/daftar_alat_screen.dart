import 'package:flutter/material.dart';

class DaftarAlatScreen extends StatelessWidget {
  const DaftarAlatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE53935),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Katalog Alat", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              children: [
                TextField(decoration: InputDecoration(hintText: "Cari Alat...", prefixIcon: const Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _categoryIcon(Icons.settings, "Semua Alat", true),
                    _categoryIcon(Icons.handyman, "Perkakas Tangan", false),
                    _categoryIcon(Icons.straighten, "Alat Ukur", false),
                    _categoryIcon(Icons.bolt, "Perkakas Listrik", false),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _itemCard("Kunci Pas Set (8-32mm)", "Perkakas Tangan", "8/10", "Baik", "Rak A1"),
                _itemCard("Obeng Set (+/-)", "Perkakas Tangan", "15/20", "Baik", "Rak B2"),
                _itemCard("Jangka Sorong Digital", "Alat Ukur", "5/8", "Baik", "Rak C1"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _categoryIcon(IconData icon, String label, bool active) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: active ? Colors.red : Colors.grey[200], borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: active ? Colors.white : Colors.black),
      ),
      const SizedBox(height: 5),
      Text(label, style: const TextStyle(fontSize: 10))
    ]);
  }

  Widget _itemCard(String name, String cat, String qty, String cond, String loc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Icon(Icons.handyman_outlined, color: Colors.grey),
            Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.green[100], borderRadius: BorderRadius.circular(5)), child: const Text("Tersedia", style: TextStyle(color: Colors.green, fontSize: 10))),
          ]),
          const SizedBox(height: 10),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(cat, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          const Divider(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _itemDetail("Ketersediaan", qty),
            _itemDetail("Kondisi", cond),
            _itemDetail("Lokasi", loc),
          ]),
          const SizedBox(height: 10),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: const Text("Pinjam Alat", style: TextStyle(color: Colors.white))))
        ],
      ),
    );
  }

  Widget _itemDetail(String label, String val) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
    Text(val, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
  ]);
}