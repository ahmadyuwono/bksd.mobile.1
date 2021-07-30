import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muba/view/home.dart';
import 'package:muba/view/page_index_konten/layanan_kerjasama/detail_layanan_kerjasama.dart';

void main() {
  runApp(MubaApp());
}

class MubaApp extends StatelessWidget {
  const MubaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        '/dashboard1': (context) => DetailLayananKerjasama(title: "ABCD"),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  Color backgroundColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.blue;
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _splashController = PageController();
  double? _currentPage = 0;

  Color textColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.white;
  }

  @override
  void initState() {
    _splashController.addListener(() {
      setState(() {
        _currentPage = _splashController.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: PageView(
          controller: _splashController,
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(top: 150),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(top: 200),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    color: Color(0xFF27405E),
                                    fontWeight: FontWeight.w700),
                              ),
                              TextSpan(text: "dan "),
                              TextSpan(
                                text: "efisiensi ",
                                style: TextStyle(
                                    color: Color(0xFF27405E),
                                    fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                  text:
                                      "dalam fasilitasi penyelenggaraan Kerja Sama Daerah yang berkualitas."),
                            ],
                          ),
                          // "Mewujudkan efektivitas dan efisiensi dalam fasilitasi penyelenggaraan Kerja Sama Daerah yang berkualitas.",
                          // textAlign: TextAlign.center,
                          // style: TextStyle(
                          //   fontSize: 18,
                          //   fontWeight: FontWeight.w300,
                          // ),
                        ),
                      ),
                      Image.asset("assets/images/indicator-page-1.png"),
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
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Container(
                padding: const EdgeInsets.only(top: 200),
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    color: Color(0xFF27405E),
                                    fontWeight: FontWeight.w700),
                              ),
                              TextSpan(text: "dan "),
                              TextSpan(
                                text: "berkesadaran tinggi ",
                                style: TextStyle(
                                    color: Color(0xFF27405E),
                                    fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                  text:
                                      "karena indeks kebahagiaan masyarakat yang tinggi."),
                            ],
                          ),
                        ),
                      ),
                      Image.asset("assets/images/indicator-page-2.png"),
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
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Beranda()));
              },
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Container(
                  padding: const EdgeInsets.only(top: 200),
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Image.asset("assets/images/indicator-page-3.png"),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
