import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muba/components/listview/listview_panduan_kerjasama.dart';
import 'package:muba/generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'package:muba/model/laporan_model.dart';
import 'package:muba/utilities/const.dart';

class PanduanKerjasama extends StatefulWidget {
  const PanduanKerjasama({Key? key}) : super(key: key);

  @override
  _PanduanKerjasamaState createState() => _PanduanKerjasamaState();
}

class _PanduanKerjasamaState extends State<PanduanKerjasama> {
  List<String> contentCard = [];
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
          body: isError == false
              ? Container(
                  padding: const EdgeInsets.only(right: 17, left: 17),
                  child: isLoaded == true
                      ? CustomScrollView(
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          slivers: [
                            SliverPadding(
                                padding: const EdgeInsets.only(top: 32)),
                            SliverList(
                              delegate: SliverChildListDelegate(List.generate(
                                  laporanModel.length,
                                  (index) => ListPanduan(
                                      contentCard: laporanModel,
                                      index: index)).toList()),
                            )
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

  Future integrateAPI() async {
    String apiURL = "${Constants.baseUri}/api/panduan_kerjasama";
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
}
