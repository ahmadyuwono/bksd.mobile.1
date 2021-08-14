import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';

class RencanaPelaksanaan extends StatefulWidget {
  final Function(String) a;
  final Function(String) b;
  final Function(String) c;
  const RencanaPelaksanaan({
    Key? key,
    required this.a,
    required this.b,
    required this.c,
  }) : super(key: key);

  @override
  _RencanaPelaksanaanState createState() => _RencanaPelaksanaanState();
}

class _RencanaPelaksanaanState extends State<RencanaPelaksanaan> {
  TextEditingController _textEditingControllerA = TextEditingController();
  TextEditingController _textEditingControllerB = TextEditingController();
  TextEditingController _textEditingControllerC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "D. ${S.of(context).rencanaPelaksana}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 18,
          ),
          Text("${S.of(context).pelaksanaan} (yyyy-mm-dd)"),
          Container(
            constraints: BoxConstraints(maxHeight: 35),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              onChanged: (value) {
                widget.a(value);
              },
              controller: _textEditingControllerA,
              keyboardType: TextInputType.datetime,
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
          Text(S.of(context).jangkaWaktu),
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
          Text(S.of(context).pembiayaan),
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
            height: 22,
          ),
        ],
      ),
    );
  }
}
