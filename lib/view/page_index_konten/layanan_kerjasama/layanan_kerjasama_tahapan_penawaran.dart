import 'package:flutter/material.dart';
import 'package:muba/components/form_tahapan_penawaran/form_tahapan_penawaran.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/view/page_index_konten/layanan_kerjasama/form_tahap_penawaran_complete.dart';

class TahapanPenawaran extends StatefulWidget {
  final String title;
  final String title2;
  const TahapanPenawaran({Key? key, required this.title, required this.title2})
      : super(key: key);

  @override
  _TahapanPenawaranState createState() => _TahapanPenawaranState();
}

class _TahapanPenawaranState extends State<TahapanPenawaran> {
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
                              S.of(context).stepTitleOffer,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(S.of(context).formStepT),
                            SizedBox(
                              height: 52,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: FormPenawaran(
                        a: (value) {},
                        b: (value) {},
                        c: (value) {},
                        d: (value) {},
                        e: (value) {}),
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
                                            FormPenawaranComplete(
                                              title: widget.title2,
                                            )));
                              },
                              child: Text(
                                S.of(context).sendForgot,
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
