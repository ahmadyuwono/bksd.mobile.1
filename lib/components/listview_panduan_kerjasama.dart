import 'package:flutter/material.dart';
import 'package:muba/components/custom_dialog.dart';

class ListPanduan extends StatefulWidget {
  final int index;
  final List contentCard;
  const ListPanduan({Key? key, required this.index, required this.contentCard})
      : super(key: key);

  @override
  _ListPanduanState createState() => _ListPanduanState();
}

class _ListPanduanState extends State<ListPanduan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) =>
                  CustomDialog(unduhFile: widget.contentCard[widget.index]));
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
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  widget.contentCard[widget.index],
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
