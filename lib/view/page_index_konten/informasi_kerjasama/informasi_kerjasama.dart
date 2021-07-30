import 'package:flutter/material.dart';
import 'package:muba/components/listview/listview_informasi_kerjasama.dart';
import 'package:muba/view/home.dart';

class InformasiKerjasama extends StatefulWidget {
  const InformasiKerjasama({Key? key}) : super(key: key);

  @override
  _InformasiKerjasamaState createState() => _InformasiKerjasamaState();
}

class _InformasiKerjasamaState extends State<InformasiKerjasama> {
  List<String> headLine = [
    "Pemkab Muba Matangkan Persiapan Lahan Jalur Pipa Gas",
    "Tingkatkan Layanan Kesehatan Muba Perkuat Antrian Online BPJS Kesehatan",
    "Inventarisir Difabel di Muba untuk Siap Kerja",
    "Pemkab Musi Banyuasin Matangkan Persiapan Lahan Jalur Pipa Gas",
    "Tingkatkan Layanan Kesehatan Muba Perkuat Antrian Online BPJS Kesehatan"
  ];

  List<String> imageAsset = [
    "assets/images/image-card-1.png",
    "assets/images/image-card-2.png",
    "assets/images/image-card-3.png",
    "assets/images/image-card-1.png",
    "assets/images/image-card-2.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27405E),
        title: Center(
          child: Text(
            "Informasi Kerja Sama",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverPadding(padding: const EdgeInsets.only(top: 24)),
            SliverList(
              delegate: SliverChildListDelegate(List.generate(
                  headLine.length,
                  (index) => ListInformasiSama(
                      imageAsset: imageAsset,
                      headLine: headLine,
                      index: index)).toList()),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF27405E),
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              activeIcon: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Beranda()));
                },
                icon: Icon(Icons.home),
              ),
              icon: Icon(Icons.home),
              label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: "Muba TV"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
