import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/services/auth_service.dart';
import 'package:muba/view/forgotpassword.dart';
import 'package:muba/view/home.dart';
import 'package:muba/view/loginscreen.dart';
import 'package:muba/view/muba_tv.dart';
import 'package:muba/view/page_index_konten/contact_center/contactcenter.dart';
import 'package:muba/view/page_index_konten/informasi_kerjasama/informasi_kerjasama.dart';
import 'package:muba/view/page_index_konten/kerjasama_dalam_negeri/kerjasama_dalam_negeri.dart';
import 'package:muba/view/page_index_konten/kerjasama_luar_negeri/kerjasama_luar_negeri.dart';
import 'package:muba/view/page_index_konten/laporan_kerjasama/laporan_kerjasama.dart';
import 'package:muba/view/page_index_konten/layanan_kerjasama/layanankerjasama.dart';
import 'package:muba/view/page_index_konten/panduan_kerjasama/panduankerjasama.dart';
import 'package:muba/view/page_index_konten/peluang_kerjasama/peluang_kerjasama.dart';
import 'package:muba/view/page_index_konten/program_kerjasama/program_kerjasama.dart';
import 'package:muba/view/page_settings/page_about.dart';
import 'package:muba/view/page_settings/page_bahasa.dart';
import 'package:muba/view/page_settings/page_copyright_policy.dart';
import 'package:muba/view/page_settings/page_privacy_policy.dart';
import 'package:muba/view/page_settings/page_terms_of_service.dart';
import 'package:muba/view/register_form.dart';
import 'package:muba/view/settings.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MubaApp());
}

class MubaApp extends StatelessWidget {
  const MubaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('id', ''),
      ],
      home: Home(),
      builder: EasyLoading.init(),
      routes: {
        '/home': (context) => Beranda(),
        '/login': (context) => LoginScreen(name: (value) {}),
        '/register': (context) => RegisterForm(),
        '/forgot': (context) => ForgotPassword(),
        '/tv': (context) => MubaTv(),
        '/settings': (context) => Settings(),
        '/panduan': (context) => PanduanKerjasama(),
        '/layanan': (context) => LayananKerjaSama(),
        '/kontak': (context) => ContactCenter(),
        '/berita': (context) => InformasiKerjasama(),
        '/domestik': (context) => KerjasamaDalamNegeri(),
        '/inter': (context) => KerjasamaLuarNegeri(),
        '/peluang': (context) => PeluangKerjasama(),
        '/program': (context) => ProgramKerjasama(),
        '/laporan': (context) => LaporanKerjasama(),
        '/bahasa': (context) => PageBahasa(),
        '/privacy': (context) => PagePrivacy(),
        '/terms': (context) => PageTerms(),
        '/copyright': (context) => PageCopyright(),
        '/about': (context) => PageAbout(),
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
                Navigator.pushNamed(context, '/home');
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
