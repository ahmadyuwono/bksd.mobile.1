import 'package:flutter/material.dart';
import 'package:muba/home.dart';

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
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/bksd_icon.png",
                      width: 650,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Welcome to BKSD MUBA Apps")
                  ],
                ),
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/splash-1.png",
                      width: 650,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                        "Mewujudkan efektivitas dan efisiensi dalam fasilitasi penyelenggaraan Kerja Sama Daerah yang berkualitas.")
                  ],
                ),
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/splash-2.png",
                      width: 650,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                        "Sosial Budaya Kab. Muba yang ramah dan berkesadaran tinggi karena indeks kebahagiaan masyarakat yang tinggi.")
                  ],
                ),
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/splash-3.png",
                      width: 650,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                        "Didukung keadaan geografis serta masyarakat yang kreatif, tiada hentinya menelurkan ide-ide destinasi wisata baru."),
                    SizedBox(
                      height: 3,
                    ),
                    FlatButton(
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Beranda"),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => Beranda()));
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
