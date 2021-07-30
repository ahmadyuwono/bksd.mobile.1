import 'package:flutter/material.dart';

class FormPenawaran extends StatefulWidget {
  final Function(String) a;
  final Function(String) b;
  final Function(String) c;
  final Function(String) d;
  final Function(String) e;
  const FormPenawaran(
      {Key? key,
      required this.a,
      required this.b,
      required this.c,
      required this.d,
      required this.e})
      : super(key: key);

  @override
  _FormPenawaranState createState() => _FormPenawaranState();
}

class _FormPenawaranState extends State<FormPenawaran> {
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
          Text("Nomor Surat"),
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
          Text("Tanggal Surat"),
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
          Text("Dengan Ini Mengajukan Penawaran KSDD"),
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
          Text("Kedudukan (Alamat)"),
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
          Text("Bertindak Untuk dan Atas Nama"),
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
            height: 151,
          ),
        ],
      ),
    );
  }
}
