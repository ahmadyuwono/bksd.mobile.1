import 'package:flutter/material.dart';

class CardVerifikasiBerkas extends StatefulWidget {
  final String image;
  final String title;
  const CardVerifikasiBerkas(
      {Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  _CardVerifikasiBerkasState createState() => _CardVerifikasiBerkasState();
}

class _CardVerifikasiBerkasState extends State<CardVerifikasiBerkas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xFF27405E)),
                ),
                padding: const EdgeInsets.only(
                    left: 43, top: 27, bottom: 19, right: 41),
                child: Column(
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: Color(0xFF27405E),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset("assets/images/patch-check.png"),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 27),
            child: Image.asset(
              widget.image,
            ),
          ),
        ],
      ),
    );
  }
}
