import 'package:flutter/material.dart';

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/splash-2.png",
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
                  TextSpan(text: "Sosial Budaya Kab. Muba yang "),
                  TextSpan(
                    text: "ramah ",
                    style: TextStyle(
                        color: Color(0xFF27405E), fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: "dan "),
                  TextSpan(
                    text: "berkesadaran tinggi ",
                    style: TextStyle(
                        color: Color(0xFF27405E), fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                      text:
                          "karena indeks kebahagiaan masyarakat yang tinggi."),
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
