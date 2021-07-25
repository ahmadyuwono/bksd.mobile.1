import 'package:flutter/material.dart';

class DetailInformasi extends StatefulWidget {
  final String title;
  const DetailInformasi({Key? key, required this.title}) : super(key: key);

  @override
  _DetailInformasiState createState() => _DetailInformasiState();
}

class _DetailInformasiState extends State<DetailInformasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27405E),
        title: Padding(
          padding: const EdgeInsets.only(left: 73),
          child: Text("Informasi Kerja Sama"),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                widget.title,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "22 Juni 2021",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Image.asset("assets/images/image-berita.png"),
            SizedBox(
              height: 7,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "Foto: Pemerintahan BKSD Muba",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "SEKAYU - Setelah melewati berbagai rangkaian penetapan lokasi rencana pembangunan jalur pipa gas bumi di wilayah Kecamatan Tungkal Jaya dan Kecamatan Bayung Lencir, fase berikut adalah proses pengerjaan yang sudah didepan mata."
                "Untuk mempertegas arah pengerjaan, Pemkab Muba menggelar rapat persiapan penetapan lokasi rencana pembangunan jalur pipa gas bumi di wilayah Kecamatan Tungkal Jaya dan Kecamatan Bayung Lencir dipimpin Bupati Musi Banyuasin Dr H "
                "Dodi Reza Alex Noerdin Lic Econ MBA diwakili oleh Sekretaris Daerah Muba Drs. H Apriyadi MSi. Menurut Apriyadi, rapat dilakukan untuk memplenokan hasil sosialisasi dan pelaksanaan monitoring terkait kewenangan yang diberikan oleh"
                "Gubernur Sumatera Selatan, kepada Pemkab Muba untuk pengadaan tanah dalam keperluan pembangunan jalur pipa gas. Kewenangan ini, tambah Apriyadi, berjalan dengan baik bahkan luas lokasi yang awalnya 23,4 hektar bertambah menjadi 23,5 ha,"
                "setelah dilakukan verifikasi monitoring lapangan. 'Untuk itu, saya ucapkan terima kasih kepada semua pihak yang terkait, yang sudah melakukan tugasnya dengan baik. Meskipun masih berada ditengah pandemi COVID-19, alhamdulilah kegiatan ini"
                "lancar, tidak ada yang terhambat dan berjalan sesuai yang diinginkan', ungkap Sekda",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
