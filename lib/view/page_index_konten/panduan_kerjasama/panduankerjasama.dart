import 'package:flutter/material.dart';
import 'package:muba/components/listview/listview_panduan_kerjasama.dart';
import 'package:muba/generated/l10n.dart';

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
            title: Center(
              child: Text(
                S.of(context).guide,
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
                        (index) => ListPanduan(
                            contentCard: contentCard, index: index)).toList()),
                  )
                ],
              )),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 2,
            backgroundColor: Color(0xFF27405E),
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.indigoAccent,
            onTap: (value) {
              if (value == 0) {
                Navigator.pushNamed(context, '/home');
              } else if (value == 1) {
                Navigator.pushNamed(context, '/tv');
              } else if (value == 2) {
                Navigator.pushNamed(context, '/settings');
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: S.of(context).homeButton),
              BottomNavigationBarItem(
                  icon: Icon(Icons.tv), label: S.of(context).tvButton),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: S.of(context).settingsButton,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
