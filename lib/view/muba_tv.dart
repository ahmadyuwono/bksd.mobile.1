import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:muba/components/listview/listview_muba_tv.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/video_model.dart';

class MubaTv extends StatefulWidget {
  const MubaTv({Key? key}) : super(key: key);

  @override
  _MubaTvState createState() => _MubaTvState();
}

class _MubaTvState extends State<MubaTv> {
  List<VideoModel> videoModel = [];
  bool isLoaded = false;
  bool isError = false;
  ScrollController _scrollController = ScrollController();
  int maxLength = 3;

  void initState() {
    super.initState();
    loadData().onError((error, stackTrace) {
      setState(() {
        isError = true;
      });
    }).then((value) {
      setState(() {});
      videoModel = value;
    }).whenComplete(() {
      setState(() {});
      isLoaded = true;
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {});
        maxLength += 3;
      }
    });
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF27405E),
        title: Center(
          child: Text(
            "Muba Tv",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: isError == false
          ? Container(
              padding: const EdgeInsets.only(left: 20, right: 10),
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
                              videoModel = value;
                            }).whenComplete(() {
                              setState(() {});
                              isLoaded = true;
                            });
                          },
                        ),
                        SliverPadding(padding: const EdgeInsets.only(top: 24)),
                        SliverList(
                          delegate: SliverChildListDelegate(List.generate(
                              videoModel.length,
                              (index) => ListviewMubaTv(
                                  data: videoModel, index: index)).toList()),
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
                      return loadData().onError((error, stackTrace) {
                        setState(() {
                          isError = true;
                        });
                      }).then((value) {
                        setState(() {});
                        videoModel = value;
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
        currentIndex: 1,
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
    );
  }

  Future integrateAPI() async {
    String apiURL = "https://muba.socketspace.com/api/galeri_video";
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
    ListVideo listModel = ListVideo.fromJson(jsonRespone);
    return listModel.video;
  }
}
