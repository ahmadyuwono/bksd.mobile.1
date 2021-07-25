import 'package:flutter/material.dart';
import 'package:muba/components/listview_panduan_kerjasama.dart';

class PanduanKerjasama extends StatefulWidget {
  const PanduanKerjasama({Key? key}) : super(key: key);

  @override
  _PanduanKerjasamaState createState() => _PanduanKerjasamaState();
}

class _PanduanKerjasamaState extends State<PanduanKerjasama> {
  List<String> contentCard = [
    "Kerja Sama Daerah Dengan Daerah Lain (KSDD)",
    "Kerja Sama Daerah Dengan Pihak Ketiga (KSDPK)",
    "Sinergi Pemerintah Pusat dan Pemerintah Daerah (SINERGI)",
    "Kerja Sama Daerah dengan Pemerintah Daerah Luar Negeri (KSDPL)",
    "Kerja Sama Daerah dengan Lembaga Luar Negeri (KSDLL)",
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
            title: Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Text("Panduan Kerja Sama"),
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
                        (index) => ListPanduan(
                            contentCard: contentCard, index: index)).toList()),
                  )
                ],
              )),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xFF27405E),
            fixedColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
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
