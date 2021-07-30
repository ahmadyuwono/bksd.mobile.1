import 'package:flutter/material.dart';
import 'package:muba/components/form_tahapan_penawaran/form_tahapan_penawaran.dart';
import 'package:muba/view/home.dart';
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
                              "FORM APLIKASI PENAWARAN",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text("Silahkan isi format dibawah ini"),
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
            backgroundColor: Color(0xFF27405E),
            fixedColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  activeIcon: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
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
        ),
      ],
    );
  }
}
