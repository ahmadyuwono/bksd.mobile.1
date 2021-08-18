import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:muba/components/listview/listview_informasi_kerjasama.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/berita_model.dart';

class InformasiKerjasama extends StatefulWidget {
  const InformasiKerjasama({Key? key}) : super(key: key);

  @override
  _InformasiKerjasamaState createState() => _InformasiKerjasamaState();
}

class _InformasiKerjasamaState extends State<InformasiKerjasama> {
  @override
  void initState() {
    super.initState();
    loadData().onError((error, stackTrace) {
      setState(() {
        isError = true;
      });
    }).then((value) {
      setState(() {});
      beritaModel = value;
    }).whenComplete(() {
      setState(() {});
      isLoaded = true;
    });
  }

  List<BeritaModel> beritaModel = [];
  bool isLoaded = false;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27405E),
        title: Center(
          child: Text(
            S.of(context).information,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: isError == false
          ? Container(
              padding: const EdgeInsets.only(left: 20),
              child: isLoaded == true
                  ? CustomScrollView(
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
                              beritaModel = value;
                            }).whenComplete(() {
                              setState(() {});
                              isLoaded = true;
                            });
                          },
                        ),
                        SliverPadding(padding: const EdgeInsets.only(top: 24)),
                        SliverList(
                          delegate: SliverChildListDelegate(List.generate(
                              beritaModel.length,
                              (index) => ListInformasiSama(
                                  headLine: beritaModel,
                                  index: index)).toList()),
                        ),
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
                      return loadData().then((value) {
                        setState(() {});
                        beritaModel = value;
                        isError = false;
                      }).whenComplete(() {
                        setState(() {});
                        isLoaded = true;
                      });
                    },
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: Text("Error"),
                    ),
                  ),
                ],
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
    );
  }

  Future integrateAPI() async {
    String apiURL = "https://muba.socketspace.com/api/berita";
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
    final jsonRespone = jsonDecode(jsonData);
    ListModel listModel = ListModel.fromJson(jsonRespone);
    return listModel.berita;
  }
}
