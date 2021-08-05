import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/view/home.dart';

class FormPenawaranComplete extends StatefulWidget {
  final String title;
  const FormPenawaranComplete({Key? key, required this.title})
      : super(key: key);

  @override
  _FormPenawaranCompleteState createState() => _FormPenawaranCompleteState();
}

class _FormPenawaranCompleteState extends State<FormPenawaranComplete> {
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
                "Tahap Penawaran",
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
                  SliverPadding(padding: const EdgeInsets.only(top: 132)),
                  SliverToBoxAdapter(
                    child: Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "BERHASIL",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.green),
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Container(
                            width: 250,
                            child: Text(
                              "PENGISIAN FORMAT KERANGKA ACUAN KERJA",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 48,
                          ),
                          Image.asset(
                            "assets/images/patch-checklist-x3.png",
                            height: 170,
                            width: 170,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            height: 40,
                            margin:
                                const EdgeInsets.only(left: 120, right: 120),
                            decoration: BoxDecoration(
                                color: Color(0xFF27405E),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Beranda()));
                                },
                                child: Text(
                                  "Kembali Dashboard",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
