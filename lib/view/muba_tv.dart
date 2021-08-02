import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:muba/components/listview/listview_muba_tv.dart';
import 'package:muba/model/video_model.dart';
import 'package:muba/view/home.dart';

class MubaTv extends StatefulWidget {
  const MubaTv({Key? key}) : super(key: key);

  @override
  _MubaTvState createState() => _MubaTvState();
}

class _MubaTvState extends State<MubaTv> {
  List<VideoModel> videoModel = [];
  bool isLoaded = false;

  void initState() {
    super.initState();
    loadData().then((value) {
      setState(() {});
      videoModel = value;
    }).whenComplete(() {
      setState(() {});
      isLoaded = true;
    });
  }

  void dispose() {
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
      body: Container(
        padding: const EdgeInsets.only(left: 20),
        child: isLoaded == true
            ? CustomScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                slivers: [
                  SliverPadding(padding: const EdgeInsets.only(top: 24)),
                  SliverList(
                    delegate: SliverChildListDelegate(List.generate(
                            videoModel.length,
                            (index) =>
                                ListviewMubaTv(data: videoModel, index: index))
                        .toList()),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: Color(0xFF27405E),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.indigoAccent,
        onTap: (value) {
          if (value == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Beranda()));
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: "Muba TV"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
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
