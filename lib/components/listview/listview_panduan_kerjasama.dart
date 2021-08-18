import 'package:flutter/material.dart';
import 'package:muba/components/custom_dialog.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/laporan_model.dart';

class ListPanduan extends StatefulWidget {
  final int index;
  final List<LaporanModel> contentCard;
  const ListPanduan({Key? key, required this.index, required this.contentCard})
      : super(key: key);

  @override
  _ListPanduanState createState() => _ListPanduanState();
}

class _ListPanduanState extends State<ListPanduan> {
  String? _fileName;
  @override
  Widget build(BuildContext context) {
    _fileName = widget.contentCard[widget.index].url
        .substring(14, widget.contentCard[widget.index].url.length);
    print(_fileName);
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          print(
              "https://muba.socketspace.com${widget.contentCard[widget.index].url.substring(1, widget.contentCard[widget.index].url.length)}");

          showDialog(
              context: context,
              builder: (_) => CustomDialog(
                  fileName: _fileName!,
                  url:
                      "https://muba.socketspace.com${widget.contentCard[widget.index].url.substring(1, widget.contentCard[widget.index].url.length)}",
                  title: S.of(context).dialogTitle,
                  unduhFile: widget.contentCard[widget.index].judul));
        },
        child: Card(
          elevation: 5,
          child: Row(
            children: [
              SizedBox(
                width: 21,
              ),
              Image.asset("assets/images/dashicons_book-alt.png"),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  widget.contentCard[widget.index].judul,
                  style: TextStyle(
                      color: Color(0xFF27405E),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
