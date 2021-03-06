import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:muba/view/page_index_konten/layanan_kerjasama/detail_layanan_kerjasama.dart';

class ListLayananSama extends StatefulWidget {
  final List contentCard;
  final int index;
  const ListLayananSama(
      {Key? key, required this.contentCard, required this.index})
      : super(key: key);

  @override
  _ListLayananSamaState createState() => _ListLayananSamaState();
}

class _ListLayananSamaState extends State<ListLayananSama> {
  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          if (widget.index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailLayananKerjasama(
                        index: widget.index + 1,
                        title: widget.contentCard[widget.index])));
          } else {
            showToast("Mohon maaf belum bisa di akses");
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Card(
            color: Color(0xFF27405E),
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: Text(
                    widget.contentCard[widget.index],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
