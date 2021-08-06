import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/utilities/shared_preferences.dart';
import 'package:muba/view/home.dart';
import 'package:muba/view/muba_tv.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> menu = [];

  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.readLanguage().then((value) {
      setState(() {
        S.load(Locale(value));
      });
    });
    SharedPreferencesHelper.readIsLogin().then((value) {
      setState(() {
        isLogin = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> menu = [
      S.of(context).generalSettings,
      S.of(context).languageButton,
      "Privacy Policy",
      "Terms of Service",
      "Copyright Policy",
      S.of(context).about,
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0x0FF27405E),
        title: Center(
          child: Text(
            S.of(context).settingsButton,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: CustomScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverPadding(padding: const EdgeInsets.only(top: 42)),
            SliverList(
              delegate: SliverChildListDelegate(List.generate(
                  menu.length,
                  (index) => Container(
                        padding: const EdgeInsets.only(bottom: 38),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            index == 0
                                ? Text(
                                    menu[index],
                                    style: TextStyle(
                                        color: index == 0
                                            ? Colors.grey
                                            : Colors.black,
                                        fontSize: 18,
                                        fontWeight: index == 0
                                            ? FontWeight.w700
                                            : FontWeight.w400),
                                  )
                                : InkWell(
                                    onTap: () async {
                                      String selectedLang =
                                          await _navigate(menu[index]);
                                      setState(() {
                                        if (index == 1) {
                                          S.load(Locale(selectedLang));
                                        }
                                      });
                                    },
                                    child: Text(
                                      menu[index],
                                      style: TextStyle(
                                          color: index == 0
                                              ? Colors.grey
                                              : Colors.black,
                                          fontSize: 18,
                                          fontWeight: index == 0
                                              ? FontWeight.w700
                                              : FontWeight.w400),
                                    ),
                                  ),
                            Divider(
                              thickness: index == 0 ? 3 : 2,
                              color: Color(0x0FF27405E),
                            ),
                          ],
                        ),
                      ))),
            ),
            SliverToBoxAdapter(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 100, height: 40),
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0x0FF27405E)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                  ),
                  onPressed: () {
                    setState(() {
                      SharedPreferencesHelper.saveIsLogin(false);
                    });
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    isLogin == true
                        ? S.of(context).logoutButton
                        : S.of(context).loginButton,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        backgroundColor: Color(0xFF27405E),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.indigoAccent,
        onTap: (value) {
          if (value == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Beranda()));
          } else if (value == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MubaTv()));
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: S.of(context).homeButton),
          BottomNavigationBarItem(
              icon: Icon(Icons.tv), label: S.of(context).tvButton),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: S.of(context).settingsButton,
          ),
        ],
      ),
    );
  }

  _navigate(routeName) {
    if (routeName == S.of(context).languageButton) {
      return Navigator.pushNamed(context, '/bahasa');
    }
    if (routeName == "Privacy Policy") {
      return Navigator.pushNamed(context, '/privacy');
    }
    if (routeName == "Terms of Service") {
      return Navigator.pushNamed(context, '/terms');
    }
    if (routeName == "Copyright Policy") {
      return Navigator.pushNamed(context, '/copyright');
    }
    if (routeName == S.of(context).about) {
      return Navigator.pushNamed(context, '/about');
    }
  }
}
