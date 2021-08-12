import 'package:flutter/material.dart';

class Item3 extends StatelessWidget {
  const Item3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/splash-3.png",
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
                    TextSpan(text: "Didukung keadaan "),
                    TextSpan(
                      text: "geografis ",
                      style: TextStyle(
                          color: Color(0xFF27405E),
                          fontWeight: FontWeight.w700),
                    ),
                    TextSpan(text: "serta masyarakat yang "),
                    TextSpan(
                      text: "kreatif",
                      style: TextStyle(
                          color: Color(0xFF27405E),
                          fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                        text:
                            ", tiada hentinya menelurkan ide-ide destinasi wisata baru."),
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
      ),
    );
  }
}
