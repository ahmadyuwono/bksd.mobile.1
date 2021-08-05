import 'package:flutter/material.dart';
import 'package:muba/components/form_tahap_persiapan/dasar_hukum.dart';
import 'package:muba/components/form_tahap_persiapan/korespondensi.dart';
import 'package:muba/components/form_tahap_persiapan/premis_rectal.dart';
import 'package:muba/components/form_tahap_persiapan/rencana_pelaksanaan.dart';
import 'package:muba/components/form_tahap_persiapan/subjek_hukum.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/view/page_index_konten/layanan_kerjasama/form_tahap_persiapan_complete.dart';

class TahapanPersiapan extends StatefulWidget {
  final String title;
  final String title2;
  const TahapanPersiapan({Key? key, required this.title, required this.title2})
      : super(key: key);

  @override
  _TahapanPersiapanState createState() => _TahapanPersiapanState();
}

class _TahapanPersiapanState extends State<TahapanPersiapan> {
  List dasarHukum = [];
  List korespondensi = [];
  List premisRectal = [];
  List rencanaPelaksanaan = [];
  List subjekHukum = [];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.amber,
        ),
        Scaffold(
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
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              color: Colors.amber,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                slivers: [
                  SliverPadding(padding: const EdgeInsets.only(top: 14)),
                  SliverToBoxAdapter(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "KERANGKA ACUAN KERJA",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text("Silahkan isi format dibawah ini"),
                            SizedBox(
                              height: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SubjekHukum(
                      a: (value) {
                        setState(() {});
                        print(value);
                        subjekHukum.add(value);
                      },
                      b: (value) {
                        setState(() {});
                        subjekHukum.add(value);
                      },
                      c: (value) {
                        setState(() {});
                        subjekHukum.add(value);
                      },
                      d: (value) {
                        setState(() {});
                        subjekHukum.add(value);
                      },
                      e: (value) {
                        setState(() {});
                        subjekHukum.add(value);
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: DasarHukum(
                      a: (value) {
                        setState(() {});
                        print(value);
                        dasarHukum.add(value);
                      },
                      b: (value) {
                        setState(() {});
                        dasarHukum.add(value);
                      },
                      c: (value) {
                        setState(() {});
                        dasarHukum.add(value);
                      },
                      d: (value) {
                        setState(() {});
                        dasarHukum.add(value);
                      },
                      e: (value) {
                        setState(() {});
                        dasarHukum.add(value);
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: PremisRectal(a: (value) {
                      setState(() {});
                      print(value);
                      premisRectal.add(value);
                    }, b: (value) {
                      setState(() {});
                      premisRectal.add(value);
                    }, c: (value) {
                      setState(() {});
                      premisRectal.add(value);
                    }, d: (value) {
                      setState(() {});
                      premisRectal.add(value);
                    }, e: (value) {
                      setState(() {});
                      premisRectal.add(value);
                    }),
                  ),
                  SliverToBoxAdapter(
                    child: RencanaPelaksanaan(
                      a: (value) {
                        setState(() {});
                        rencanaPelaksanaan.add(value);
                      },
                      b: (value) {
                        setState(() {});
                        rencanaPelaksanaan.add(value);
                      },
                      c: (value) {
                        setState(() {});
                        rencanaPelaksanaan.add(value);
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Korespondensi(
                      a: (value) {
                        setState(() {});
                        korespondensi.add(value);
                      },
                      b: (value) {
                        setState(() {});
                        korespondensi.add(value);
                      },
                      c: (value) {
                        setState(() {});
                        korespondensi.add(value);
                      },
                      d: (value) {
                        setState(() {});
                        korespondensi.add(value);
                      },
                      e: (value) {
                        setState(() {});
                        korespondensi.add(value);
                      },
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          height: 55,
                          margin: const EdgeInsets.only(left: 85, right: 85),
                          decoration: BoxDecoration(
                              color: Color(0xFF27405E),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TahapPersiapanComplete(
                                              title: widget.title2,
                                            )));
                              },
                              child: Text(
                                "KIRIM",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
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
