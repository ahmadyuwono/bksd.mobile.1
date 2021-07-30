import 'package:flutter/material.dart';
import 'package:muba/view/page_index_konten/informasi_kerjasama/detail_informasi_kerjasama.dart';

class ListInformasiSama extends StatefulWidget {
  final List imageAsset;
  final List headLine;
  final int index;
  const ListInformasiSama(
      {Key? key,
      required this.imageAsset,
      required this.headLine,
      required this.index})
      : super(key: key);

  @override
  _ListInformasiSamaState createState() => _ListInformasiSamaState();
}

class _ListInformasiSamaState extends State<ListInformasiSama> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailInformasi(
                      title: widget.headLine[widget.index],
                    )));
      },
      child: Container(
        height: 137,
        padding: const EdgeInsets.only(bottom: 13),
        child: Row(
          children: [
            Image.asset(widget.imageAsset[widget.index]),
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
                    widget.headLine[widget.index],
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "22 Juni 2021",
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
