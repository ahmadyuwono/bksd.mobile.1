import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/services/auth_service.dart';
import 'package:muba/view/carousel_splashscreen.dart';
import 'package:muba/view/forgotpassword.dart';
import 'package:muba/view/home.dart';
import 'package:muba/view/loginscreen.dart';
import 'package:muba/view/muba_tv.dart';
import 'package:muba/view/page_index_konten/contact_center/contactcenter.dart';
import 'package:muba/view/page_index_konten/informasi_kerjasama/informasi_kerjasama.dart';
import 'package:muba/view/page_index_konten/kerjasama_dalam_negeri/kerjasama_dalam_negeri.dart';
import 'package:muba/view/page_index_konten/kerjasama_luar_negeri/kerjasama_luar_negeri.dart';
import 'package:muba/view/page_index_konten/laporan_kerjasama/laporan_kerjasama.dart';
import 'package:muba/view/page_index_konten/layanan_kerjasama/form_tahap_penawaran_complete.dart';
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
import 'package:carousel_slider/carousel_slider.dart';
import 'package:open_file/open_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MubaApp()));
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
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
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

  void _checkUserSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isStatus = prefs.getBool("KEY ISLOGIN") ?? false;
    if (isStatus) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Beranda()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CarouselSplash()));
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      _checkUserSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/logo-kab-muba.png",
            width: MediaQuery.of(context).size.width * 0.50,
            height: MediaQuery.of(context).size.height * 0.50),
      ),
    );
  }
}
