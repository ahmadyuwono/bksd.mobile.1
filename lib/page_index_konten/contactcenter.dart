import 'package:flutter/material.dart';

class ContactCenter extends StatefulWidget {
  const ContactCenter({Key? key}) : super(key: key);

  @override
  _ContactCenterState createState() => _ContactCenterState();
}

class _ContactCenterState extends State<ContactCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27405E),
        title: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Text("Contact Center"),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 29, right: 29, top: 37),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: [
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
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "Silahkan Pilih Platform Untuk Menghubungi Bagian Contact Center",
                  style: TextStyle(
                      color: Color(0xFF27405E),
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 34,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Color(0xFF27405E),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 25, bottom: 43),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Pilih Platform",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/logos_whatsapp.png"),
                          SizedBox(
                            width: 11.88,
                          ),
                          Text(
                            "Whatsapp",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 29,
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 33,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                              "assets/images/ant-design_mail-filled.png"),
                          SizedBox(
                            width: 10.88,
                          ),
                          Text(
                            "E-Mail",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF27405E),
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
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
