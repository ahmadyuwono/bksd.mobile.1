import 'package:flutter/material.dart';
import 'package:muba/components/listview/listview_layanan_kerjasama.dart';
import 'package:muba/generated/l10n.dart';

class LayananKerjaSama extends StatefulWidget {
  const LayananKerjaSama({Key? key}) : super(key: key);

  @override
  _LayananKerjaSamaState createState() => _LayananKerjaSamaState();
}

class _LayananKerjaSamaState extends State<LayananKerjaSama> {
  List<String> contentCard = [];

  @override
  Widget build(BuildContext context) {
    List<String> contentCard = [
      "${S.of(context).facilitation} ${S.of(context).ksdd}",
      "${S.of(context).facilitation} ${S.of(context).ksdpk}",
      "${S.of(context).facilitation} ${S.of(context).sinergi}",
      "${S.of(context).facilitation} ${S.of(context).ksdpl}",
      "${S.of(context).facilitation} ${S.of(context).ksdll}",
    ];
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
                S.of(context).service,
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
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
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
