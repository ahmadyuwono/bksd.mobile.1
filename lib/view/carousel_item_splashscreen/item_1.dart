import 'package:flutter/material.dart';

class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/splash-1.png",
            // height: 100,
            // width: 650,
          ),
          Container(
            width: 250,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(text: "Mewujudkan "),
                  TextSpan(
                    text: "efektivitas ",
                    style: TextStyle(
                        color: Color(0xFF27405E), fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: "dan "),
                  TextSpan(
                    text: "efisiensi ",
                    style: TextStyle(
                        color: Color(0xFF27405E), fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                      text:
                          "dalam fasilitasi penyelenggaraan Kerja Sama Daerah yang berkualitas."),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo-kab-muba.png"),
              SizedBox(
                width: 9,
              ),
              Container(
                width: 174,
                height: 42,
                child: Text(
                  "BAGIAN KERJASAMA KABUPATEN MUBA",
                  style: TextStyle(
                      color: Color(0xFF27405E),
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
