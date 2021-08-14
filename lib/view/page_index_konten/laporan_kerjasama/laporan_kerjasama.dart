import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:muba/components/tabbarview/tabbarview_laporan_dalam.dart';
import 'package:muba/components/tabbarview/tabbarview_proker_luar.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/laporan_model.dart';
import 'package:muba/model/program_model.dart';
import 'package:http/http.dart' as http;

class LaporanKerjasama extends StatefulWidget {
  const LaporanKerjasama({Key? key}) : super(key: key);

  @override
  _LaporanKerjasamaState createState() => _LaporanKerjasamaState();
}

class _LaporanKerjasamaState extends State<LaporanKerjasama> {
  List<LaporanModel> laporanModel = [];
  bool isLoaded = false;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    loadData().onError((error, stackTrace) {
      setState(() {
        isError = true;
      });
    }).then((value) {
      setState(() {});
      laporanModel = value;
    }).whenComplete(() {
      setState(() {});
      isLoaded = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset("assets/images/bg-city.png"),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Color(0xFF27405E),
            title: Center(
              child: Text(
                S.of(context).report,
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          body: isError == false
              ? Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: isLoaded == true
                      ? CustomScrollView(
                          physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          slivers: [
                            SliverPadding(
                              padding: const EdgeInsets.only(top: 20),
                            ),
                            CupertinoSliverRefreshControl(
                              onRefresh: () {
                                return loadData().onError((error, stackTrace) {
                                  setState(() {
                                    isError = true;
                                  });
                                }).then((value) {
                                  setState(() {});
                                  laporanModel = value;
                                }).whenComplete(() {
                                  setState(() {});
                                  isLoaded = true;
                                });
                              },
                            ),
                            SliverList(
                                delegate: SliverChildListDelegate(List.generate(
                              1,
                              (index) => Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Color(0x0FF27405E),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      laporanModel[laporanModel.indexWhere(
                                              (element) =>
                                                  element.judul ==
                                                  "Monitoring dan Evaluasi")]
                                          .judul,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      _parseHtmlString(laporanModel[laporanModel
                                              .indexWhere((element) =>
                                                  element.judul ==
                                                  "Monitoring dan Evaluasi")]
                                          .isi!),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ))),
                          ],
                        )
                      : Center(
                          child: SizedBox(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator(
                            color: Color(0xFF27405E),
                            strokeWidth: 8,
                            backgroundColor: Colors.transparent,
                          ),
                        )),
                )
              : Container(
                  child: CustomScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  slivers: [
                    CupertinoSliverRefreshControl(
                      onRefresh: () {
                        return loadData().onError((error, stackTrace) {
                          setState(() {
                            isError = true;
                          });
                        }).then((value) {
                          setState(() {});
                          laporanModel = value;
                        }).whenComplete(() {
                          setState(() {});
                          isLoaded = true;
                        });
                      },
                    ),
                    SliverToBoxAdapter(
                      child: Center(
                        child: Text("Error Internet?"),
                      ),
                    ),
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

  Future integrateAPI() async {
    String apiURL = "https://muba.socketspace.com/api/pages";
    var response = await http.get(Uri.parse(apiURL));
    if (response.statusCode == 200) {
      print(response.statusCode);
      return response.body;
    } else {
      print(response.statusCode);
      throw Exception('Failed');
    }
  }

  Future loadData() async {
    String jsonData = await integrateAPI();
    final jsonResponse = jsonDecode(jsonData);
    ListLaporan listModel = ListLaporan.fromJson(jsonResponse);
    return listModel.laporan;
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }
}
