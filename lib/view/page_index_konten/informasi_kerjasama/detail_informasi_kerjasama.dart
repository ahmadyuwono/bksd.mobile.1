import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/utilities/const.dart';

class DetailInformasi extends StatefulWidget {
  final String title;
  final String date;
  final String image;
  final String content;
  final String source;
  const DetailInformasi(
      {Key? key,
      required this.title,
      required this.date,
      required this.image,
      required this.content,
      required this.source})
      : super(key: key);

  @override
  _DetailInformasiState createState() => _DetailInformasiState();
}

class _DetailInformasiState extends State<DetailInformasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27405E),
        title: Center(child: Text(S.of(context).information)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
              Image.network(
                  "${Constants.baseUri}/uploads/berita/${widget.image}"),
              SizedBox(
                height: 7,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "${S.of(context).source} : ${widget.source}",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  _parseHtmlString(widget.content),
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
            ],
          ),
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

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }
}
