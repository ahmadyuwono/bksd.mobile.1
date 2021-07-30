import 'package:flutter/material.dart';

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
            "D. RENCANA PELAKSANAAN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 18,
          ),
          Text("Pelaksanaan"),
          Container(
            constraints: BoxConstraints(maxHeight: 35),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              onEditingComplete: () {
                widget.a(_textEditingControllerA.text);
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
          Text("Jangka Waktu"),
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
          Text("Pembiayaan"),
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
            height: 22,
          ),
        ],
      ),
    );
  }
}
