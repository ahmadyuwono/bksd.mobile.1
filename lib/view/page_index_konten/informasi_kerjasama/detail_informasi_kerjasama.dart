import 'package:flutter/material.dart';

class DetailInformasi extends StatefulWidget {
  final String title;
  final String date;
  final String image;
  final String content;
  const DetailInformasi(
      {Key? key,
      required this.title,
      required this.date,
      required this.image,
      required this.content})
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
        title: Center(child: Text("Informasi Kerja Sama")),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                "https://muba.socketspace.com/uploads/berita/${widget.image}"),
            SizedBox(
              height: 7,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "Foto: Pemerintahan BKSD Muba",
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
                widget.content,
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
