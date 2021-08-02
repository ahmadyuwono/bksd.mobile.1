import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muba/view/home.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailMubaTv extends StatefulWidget {
  final String title;
  final String date;
  final String image;
  const DetailMubaTv({
    Key? key,
    required this.title,
    required this.date,
    required this.image,
  }) : super(key: key);

  @override
  _DetailMubaTvState createState() => _DetailMubaTvState();
}

class _DetailMubaTvState extends State<DetailMubaTv> {
  late YoutubePlayerController _youtubePlayerControllerWeb;
  final Completer<WebViewController> _webController =
      Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {}
    _youtubePlayerControllerWeb = YoutubePlayerController(
      initialVideoId: widget.image,
    );
    _youtubePlayerControllerWeb.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    };
    _youtubePlayerControllerWeb.onExitFullscreen = () {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27405E),
        title: Center(child: Text("Muba Tv")),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                widget.title,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                widget.date,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              child: YoutubePlayerIFrame(
                controller: _youtubePlayerControllerWeb,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "Sumber Video: Youtube",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 13,
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
}
