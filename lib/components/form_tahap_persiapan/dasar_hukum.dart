import 'package:flutter/material.dart';

class DasarHukum extends StatefulWidget {
  final Function(String) a;
  final Function(String) b;
  final Function(String) c;
  final Function(String) d;
  final Function(String) e;
  const DasarHukum(
      {Key? key,
      required this.a,
      required this.b,
      required this.c,
      required this.d,
      required this.e})
      : super(key: key);

  @override
  _DasarHukumState createState() => _DasarHukumState();
}

class _DasarHukumState extends State<DasarHukum> {
  TextEditingController _textEditingControllerA = TextEditingController();
  TextEditingController _textEditingControllerB = TextEditingController();
  TextEditingController _textEditingControllerC = TextEditingController();
  TextEditingController _textEditingControllerD = TextEditingController();
  TextEditingController _textEditingControllerE = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "B. DASAR HUKUM",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 18,
          ),
          Text("Undang-undang"),
          Container(
            constraints: BoxConstraints(maxHeight: 35),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              controller: _textEditingControllerA,
              onEditingComplete: () {
                widget.a(_textEditingControllerA.text);
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                contentPadding: const EdgeInsets.only(left: 10, bottom: 15),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Peraturan Pemerintah"),
          Container(
            constraints: BoxConstraints(maxHeight: 35),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              onEditingComplete: () {
                widget.b(_textEditingControllerB.text);
              },
              controller: _textEditingControllerB,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                contentPadding: const EdgeInsets.only(left: 10, bottom: 15),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Peraturan Presiden"),
          Container(
            constraints: BoxConstraints(maxHeight: 35),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              onEditingComplete: () {
                widget.c(_textEditingControllerC.text);
              },
              controller: _textEditingControllerC,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                contentPadding: const EdgeInsets.only(left: 10, bottom: 15),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Peraturan Menteri / Kepala LNPK"),
          Container(
            constraints: BoxConstraints(maxHeight: 35),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              onEditingComplete: () {
                widget.d(_textEditingControllerD.text);
              },
              controller: _textEditingControllerD,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                contentPadding: const EdgeInsets.only(left: 10, bottom: 15),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Peraturan Daerah dan/ atau Peraturan Bupati"),
          Container(
            constraints: BoxConstraints(maxHeight: 35),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              onEditingComplete: () {
                widget.e(_textEditingControllerE.text);
              },
              controller: _textEditingControllerE,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                contentPadding: const EdgeInsets.only(left: 10, bottom: 15),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
        ],
      ),
    );
  }
}
