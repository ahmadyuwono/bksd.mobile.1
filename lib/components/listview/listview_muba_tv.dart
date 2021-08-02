import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muba/model/video_model.dart';
import 'package:muba/view/detail_muba_tv.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ListviewMubaTv extends StatefulWidget {
  final List<VideoModel> data;
  final int index;
  const ListviewMubaTv({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  _ListviewMubaTvState createState() => _ListviewMubaTvState();
}

class _ListviewMubaTvState extends State<ListviewMubaTv> {
  late VideoPlayerController _controller;
  void initState() {
    super.initState();
    if (widget.data[widget.index].url.contains("https")) {
      urlVideo = widget.data[widget.index].url
          .substring(30, widget.data[widget.index].url.length);
    }
    _controller = VideoPlayerController.network(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
      ..addListener(() {
        setState(() {
          videoPosition = _controller.value.position;
        });
      })
      ..initialize().then((_) {
        setState(() {
          videoLength = _controller.value.duration;
        });
      });
  }

  late Duration videoLength;
  late Duration videoPosition;
  String urlVideo = "";
  String quality = ThumbnailQuality.standard;

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(widget.data[widget.index].created_at);
    String formattedDate = DateFormat("dd MMMM yyyy").format(date);
    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailMubaTv(
                      title: widget.data[widget.index].judul,
                      date: formattedDate,
                      image: urlVideo,
                    )));
      },
      child: Container(
        height: 137,
        padding: const EdgeInsets.only(bottom: 13),
        child: Row(
          children: [
            Image.network("https://i3.ytimg.com/vi/$urlVideo/$quality.jpg"),
            SizedBox(
              width: 18,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data[widget.index].judul,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "$formattedDate",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
