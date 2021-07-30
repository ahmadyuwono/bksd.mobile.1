import 'package:flutter/material.dart';
import 'package:muba/components/listview/listview_layanan_kerjasama.dart';
import 'package:muba/view/home.dart';

class LayananKerjaSama extends StatefulWidget {
  const LayananKerjaSama({Key? key}) : super(key: key);

  @override
  _LayananKerjaSamaState createState() => _LayananKerjaSamaState();
}

class _LayananKerjaSamaState extends State<LayananKerjaSama> {
  List<String> contentCard = [
    "Fasilitasi Kerja Sama Daerah dengan Daerah Lain (KSDD)",
    "Fasilitasi Kerja Sama Daerah dengan Pihak Ketiga (KSDPK)",
    "Fasilitasi Sinergi Pemerintah Pusat dan Pemerintah Daerah (SINERGI)",
    "Fasilitasi Kerja Sama Daerah dengan Pemerintah Daerah Luar Negeri (KSDPL)",
    "Fasilitasi Kerja Sama Daerah dengan Lembaga Luar Negeri (KSDLL)",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.amber,
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset("assets/images/bg-city.png")),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Color(0xFF27405E),
            title: Center(
              child: Text(
                "Layanan Kerja Sama",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          body: Container(
              padding: const EdgeInsets.only(right: 17, left: 17),
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                slivers: [
                  SliverPadding(padding: const EdgeInsets.only(top: 32)),
                  SliverList(
                    delegate: SliverChildListDelegate(List.generate(
                        contentCard.length,
                        (index) => ListLayananSama(
                            contentCard: contentCard, index: index)).toList()),
                  )
                ],
              )),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xFF27405E),
            fixedColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  activeIcon: IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Beranda()));
                    },
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
        ),
      ],
    );
  }
}
