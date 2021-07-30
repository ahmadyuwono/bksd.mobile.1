import 'package:flutter/material.dart';
import 'package:muba/components/card_verifikasi_berkas.dart';
import 'package:muba/view/home.dart';

class KerjasamaLuarNegeri extends StatefulWidget {
  const KerjasamaLuarNegeri({Key? key}) : super(key: key);

  @override
  _KerjasamaLuarNegeriState createState() => _KerjasamaLuarNegeriState();
}

class _KerjasamaLuarNegeriState extends State<KerjasamaLuarNegeri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27405E),
        title: Center(
          child: Text(
            "Kerja Sama Luar Negeri",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(left: 21, right: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 13),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0xFF27405E),
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF27405E),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                          ),
                          width: 86,
                          child: Center(
                              child:
                                  Image.asset("assets/images/user-avatar.png")),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 13, bottom: 17),
                          width: MediaQuery.of(context).size.width * 0.60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Muhammad Jihad",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF27405E),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Alamat :"),
                              Text(
                                  "Jalan Akasia Delphina No. 18 Bumi Panyawangan"),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Email :"),
                              Text("muhammadjihad@mail.com"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                " Berkas ID :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF27405E),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 9),
                      hintText: "DN-2021-00001",
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CardVerifikasiBerkas(
                  image: "assets/images/card-membership.png",
                  title: "SUDAH TERDAFTAR SEBAGAI MEMBER"),
              SizedBox(
                height: 10,
              ),
              CardVerifikasiBerkas(
                  image: "assets/images/document.png", title: "UPLOAD BERKAS"),
              SizedBox(
                height: 10,
              ),
              CardVerifikasiBerkas(
                  image: "assets/images/document-checklist.png",
                  title: "BERKAS TELAH DIVERIFIKASI"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF27405E),
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              activeIcon: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Beranda()));
                },
                icon: Icon(Icons.home),
              ),
              icon: Icon(Icons.home),
              label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: "Muba TV"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
