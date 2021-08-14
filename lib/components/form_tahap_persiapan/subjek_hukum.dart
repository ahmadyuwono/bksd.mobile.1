import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';

class SubjekHukum extends StatefulWidget {
  final Function(String) a;
  final Function(String) b;
  final Function(String) c;
  final Function(String) d;
  final Function(String) e;
  const SubjekHukum(
      {Key? key,
      required this.a,
      required this.b,
      required this.c,
      required this.d,
      required this.e})
      : super(key: key);

  @override
  _SubjekHukumState createState() => _SubjekHukumState();
}

class _SubjekHukumState extends State<SubjekHukum> {
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
            "A. ${S.of(context).subjekHukum}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 18,
          ),
          Text(S.of(context).namaDaerah),
          Container(
            constraints: BoxConstraints(maxHeight: 35),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              onChanged: (value) {
                widget.a(value);
              },
              controller: _textEditingControllerA,
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
          Text(S.of(context).namaKepalaDaerah),
          Container(
            constraints: BoxConstraints(maxHeight: 35),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              onChanged: (value) {
                widget.b(value);
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
          Text(S.of(context).nomorSKPengangkatan),
          Container(
            constraints: BoxConstraints(maxHeight: 35),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              onChanged: (value) {
                widget.c(value);
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
          Text(S.of(context).address),
          Container(
            constraints: BoxConstraints(maxHeight: 35),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              onChanged: (value) {
                widget.d(value);
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
          Text(S.of(context).actBehalf),
          Container(
            constraints: BoxConstraints(maxHeight: 35),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              onChanged: (value) {
                widget.e(value);
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
