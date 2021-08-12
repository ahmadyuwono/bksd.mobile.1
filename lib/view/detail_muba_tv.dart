import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muba/generated/l10n.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailMubaTv extends StatefulWidget {
  final String title;
  final String date;
  final String videoId;
  final String urlVideo;
  const DetailMubaTv(
      {Key? key,
      required this.title,
      required this.date,
      required this.videoId,
      required this.urlVideo})
      : super(key: key);

  @override
  _DetailMubaTvState createState() => _DetailMubaTvState();
}

class _DetailMubaTvState extends State<DetailMubaTv> {
  YoutubePlayerController? _youtubePlayerControllerWeb;
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {}
    _youtubePlayerControllerWeb = YoutubePlayerController(
        initialVideoId: widget.videoId,
        flags: YoutubePlayerFlags(
          controlsVisibleAtStart: true,
          autoPlay: false,
        ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    _youtubePlayerControllerWeb?.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
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
              child: YoutubePlayer(
                controller: _youtubePlayerControllerWeb!,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "${S.of(context).source} : ${widget.urlVideo}",
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
}
