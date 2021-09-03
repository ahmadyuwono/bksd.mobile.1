import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/view/page_index_konten/layanan_kerjasama/layanan_kerjasama_tahapan_penawaran.dart';
import 'package:muba/view/page_index_konten/layanan_kerjasama/layanan_kerjasama_tahapan_persiapan.dart';

class DetailLayananKerjasama extends StatefulWidget {
  final String title;
  final int index;
  const DetailLayananKerjasama(
      {Key? key, required this.title, required this.index})
      : super(key: key);

  @override
  _DetailLayananKerjasamaState createState() => _DetailLayananKerjasamaState();
}

class _DetailLayananKerjasamaState extends State<DetailLayananKerjasama> {
  List<String> textContent = [];

  @override
  Widget build(BuildContext context) {
    List<String> textContent = [
      S.of(context).prepPhase,
      S.of(context).offerPhase,
      "${S.of(context).susunPhase} KB",
      "${S.of(context).reviewPhase} KB",
      "${S.of(context).signPhase} KB",
      "${S.of(context).agreePhase} DPRD",
      "${S.of(context).susunPhase} PKS",
      "${S.of(context).reviewPhase} PKS",
      "${S.of(context).signPhase} PKS",
      "${S.of(context).executePhase} PKS",
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
                widget.title,
                maxLines: 3,
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
                  SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return InkWell(
                            onTap: () {
                              _navigate(
                                  textContent[index], widget.index, index + 1);
                            },
                            child: Card(
                              color: Color(0xFF27405E),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "${index + 1}. ${textContent[index]}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: textContent.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 3.5,
                          mainAxisSpacing: 19,
                          crossAxisSpacing: 18,
                          crossAxisCount: 2))
                ],
              )),
          bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: TextStyle(fontSize: 11),
            unselectedLabelStyle: TextStyle(fontSize: 11),
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

  _navigate(String routeName, int index, int indexTahap) {
    if (routeName == S.of(context).prepPhase) {
      return Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TahapanPersiapan(
                    jenis: indexTahap.toString(),
                    fasilitas: index.toString(),
                    title: routeName,
                    title2: widget.title,
                  )));
    }
    if (routeName == S.of(context).offerPhase) {
      return Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TahapanPenawaran(
                    jenis: indexTahap.toString(),
                    fasilitas: index.toString(),
                    title: routeName,
                    title2: widget.title,
                  )));
    }
  }
}
