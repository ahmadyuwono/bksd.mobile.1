import 'package:flutter/material.dart';

class Item0 extends StatelessWidget {
  const Item0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/bksd_icon.png",
            width: 650,
          ),
          SizedBox(
            height: 3,
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
