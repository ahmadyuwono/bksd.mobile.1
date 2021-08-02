import 'package:flutter/material.dart';
import 'package:muba/utilities/shared_preferences.dart';
import 'package:muba/view/loginscreen.dart';
import 'package:muba/view/muba_tv.dart';
import 'package:muba/view/page_index_konten/contact_center/contactcenter.dart';
import 'package:muba/view/page_index_konten/informasi_kerjasama/informasi_kerjasama.dart';
import 'package:muba/view/page_index_konten/kerjasama_dalam_negeri/kerjasama_dalam_negeri.dart';
import 'package:muba/view/page_index_konten/kerjasama_luar_negeri/kerjasama_luar_negeri.dart';
import 'package:muba/view/page_index_konten/laporan_kerjasama/laporan_kerjasama.dart';
import 'package:muba/view/page_index_konten/panduan_kerjasama/panduankerjasama.dart';
import 'package:muba/view/page_index_konten/peluang_kerjasama/peluang_kerjasama.dart';
import 'package:muba/view/page_index_konten/program_kerjasama/program_kerjasama.dart';

import 'page_index_konten/layanan_kerjasama/layanankerjasama.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  String name = "";
  bool isLogin = false;
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
    "assets/images/index-1.png",
    "assets/images/index-2.png",
    "assets/images/index-3.png",
    "assets/images/index-4.png",
    "assets/images/index-5.png",
    "assets/images/index-6.png",
    "assets/images/index-7.png",
    "assets/images/index-8.png",
    "assets/images/index-9.png",
  ];

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.readIsLogin().then((value) {
      setState(() {
        isLogin = value;
      });
    });
    SharedPreferencesHelper.readName().then((value) {
      setState(() {
        name = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF27405E),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/db-bg-x3.png",
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50, right: 24),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                SharedPreferencesHelper.clearAllData();
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen(
                                            name: (value) {
                                              setState(() {});
                                            },
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF27405E),
                                  borderRadius: BorderRadius.circular(5)),
                              width: MediaQuery.of(context).size.width * 0.30,
                              height: 30,
                              child: Center(
                                child: Text(
                                  isLogin == true
                                      ? "Hello, $name! Logout"
                                      : "LOGIN OR REGISTER",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                Container(
                  color: Color(0xFF27405E),
                  padding: EdgeInsets.all(20),
                  child: Material(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (ctx, i) {
                        return Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 36,
                              ),
                              InkWell(
                                child: Image.asset(
                                  icons[i],
                                  width: 53,
                                  height: 53,
                                  color: Color(0xFF27405E),
                                ),
                                onTap: () {
                                  _navigateRoute(service[i]);
                                },
                              ),
                              Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width * 0.20,
                                decoration: BoxDecoration(
                                    color: Color(0xFF27405E),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    service[i],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Text(
                //     "#CenterOfSmartCollaboration",
                //     style: TextStyle(color: Color(0xFF27405E)),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF27405E),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.indigoAccent,
        onTap: (value) {
          // switch (value) {
          //   case 1:
          //     return Navigator.push(
          //       context,
          //     );
          if (value == 1) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MubaTv()));
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              activeIcon: IconButton(
                icon: Icon(Icons.tv),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MubaTv()));
                },
              ),
              icon: Icon(Icons.tv),
              label: "Muba TV"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  _navigateRoute(routeName) {
    if (isLogin == true) {
      switch (routeName) {
        case "Contact Center":
          return Navigator.push(context,
              MaterialPageRoute(builder: (context) => ContactCenter()));
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
        case "Program Kerjasama":
          return Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProgramKerjasama()));
        case "Laporan Kerjasama":
          return Navigator.push(context,
              MaterialPageRoute(builder: (context) => LaporanKerjasama()));
      }
    } else {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                backgroundColor: Color(0xFF27405E),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: Container(
                    child: Text(
                  "Harap Login Terlebih Dahulu",
                  style: TextStyle(color: Colors.white),
                )),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              ));
    }
  }
}
