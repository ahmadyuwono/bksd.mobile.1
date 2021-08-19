import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muba/model/berita_model.dart';
import 'package:muba/utilities/const.dart';
import 'package:muba/view/page_index_konten/informasi_kerjasama/detail_informasi_kerjasama.dart';

class ListInformasiSama extends StatefulWidget {
  final List<BeritaModel> headLine;
  final int index;
  const ListInformasiSama(
      {Key? key, required this.headLine, required this.index})
      : super(key: key);

  @override
  _ListInformasiSamaState createState() => _ListInformasiSamaState();
}

class _ListInformasiSamaState extends State<ListInformasiSama> {
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(widget.headLine[widget.index].tanggal);
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
                builder: (context) => DetailInformasi(
                      title: widget.headLine[widget.index].judul,
                      date: formattedDate,
                      content: widget.headLine[widget.index].isi,
                      image: widget.headLine[widget.index].foto,
                      source: widget.headLine[widget.index].sumber_foto,
                    )));
      },
      child: Container(
        height: 137,
        padding: const EdgeInsets.only(bottom: 13),
        child: Row(
          children: [
            Image.network(
              "${Constants.baseUri}/uploads/berita/${widget.headLine[widget.index].foto}",
              width: MediaQuery.of(context).size.width * 0.40,
            ),
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
                    widget.headLine[widget.index].judul,
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

//base_url/uploads/berita
