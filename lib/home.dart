import 'package:flutter/material.dart';
import 'package:muba/loginscreen.dart';
import 'package:muba/page_index_konten/contactcenter.dart';
import 'package:muba/page_index_konten/informasi_kerjasama.dart';
import 'package:muba/page_index_konten/kerjasama_dalam_negeri.dart';
import 'package:muba/page_index_konten/kerjasama_luar_negeri.dart';
import 'package:muba/page_index_konten/panduankerjasama.dart';
import 'package:muba/page_index_konten/peluang_kerjasama.dart';

import 'page_index_konten/layanankerjasama.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  List<String> service = [
    "Panduan Kerjasama",
    "Layanan Kerjasama",
    "Contact Center",
    "Informasi Kerjasama",
    "Kerjasama Dalam Negeri",
    "Kerjasama Luar Negeri",
    "Peluang Kerjasama",
    "Program Kerjasama",
    "Laporan Kerjasama"
  ];

  List<String> icons = [
    "assets/images/icon-panduan.png",
    "assets/images/Group-ks-layanan.png",
    "assets/images/Group-contact-centrecontact-centre.png",
    "assets/images/carbon_information.png",
    "assets/images/Group-ks-dalam-negeri.png",
    "assets/images/Group-kerja-sama-luar-negeriks-luar-negeri.png",
    "assets/images/Group-ks-peluang.png",
    "assets/images/Group-ks-program.png",
    "assets/images/icon-panduan.png",
    "assets/images/ks-laporan.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Image.asset(
                    "assets/images/hero-bksd-mobile_1.png",
                    width: double.infinity,
                  ),
                ),
                Container(
                  color: Color(0xFF27405E),
                  padding: EdgeInsets.all(20),
                  child: Material(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (ctx, i) {
                        return Container(
                          child: Column(
                            children: [
                              InkWell(
                                child: Image.asset(icons[i]),
                                onTap: () {
                                  _navigateRoute(service[i]);
                                },
                              ),
                              Text(
                                service[i],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF27405E),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: "Muba TV"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  _navigateRoute(routeName) {
    switch (routeName) {
      case "Contact Center":
        return Navigator.push(
            context, MaterialPageRoute(builder: (context) => ContactCenter()));
      case "Panduan Kerjasama":
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => PanduanKerjasama()));
      case "Layanan Kerjasama":
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => LayananKerjaSama()));
      case "Informasi Kerjasama":
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => InformasiKerjasama()));
      case "Kerjasama Dalam Negeri":
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => KerjasamaDalamNegeri()));
      case "Kerjasama Luar Negeri":
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => KerjasamaLuarNegeri()));
      case "Peluang Kerjasama":
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => PeluangKerjasama()));
    }
  }
}
