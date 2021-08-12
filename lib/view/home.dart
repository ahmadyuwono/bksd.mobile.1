import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/services/auth_service.dart';
import 'package:muba/utilities/shared_preferences.dart';
import 'package:muba/view/loginscreen.dart';
import 'package:muba/view/muba_tv.dart';
import 'package:muba/view/settings.dart';
import 'package:provider/provider.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  String name = "";
  bool isLogin = false;
  late bool isSelected;
  String token = "";
  String email = "";
  List<String> service = [];
  ScrollController _scrollController = ScrollController();
  ScrollPhysics? _scrollPhysics;

  List icons = [
    CupertinoIcons.compass,
    CupertinoIcons.group,
    Icons.contact_phone_outlined,
    CupertinoIcons.info,
    "assets/images/index-5.png",
    "assets/images/index-6.png",
    Icons.lightbulb_outlined,
    Icons.fact_check_outlined,
    CupertinoIcons.doc_text,
  ];

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.readIsLogin().then((value) {
      setState(() {
        isLogin = value;
      });
    });
    SharedPreferencesHelper.readName().then((value) {
      setState(() {
        name = value;
      });
    });
    SharedPreferencesHelper.readUsername().then((value) {
      setState(() {});
      email = value;
    });
    SharedPreferencesHelper.readToken().then((value) {
      setState(() {});
      token = value;
    });
    SharedPreferencesHelper.readLanguage().then((value) {
      setState(() {
        value.isNotEmpty ? S.load(Locale(value)) : S.load(Locale("en"));
      });
    });
    SharedPreferencesHelper.readIsSelected().then((value) {
      setState(() {
        isSelected = value;
      });
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 0) {
        setState(() => _scrollPhysics = NeverScrollableScrollPhysics());
      } else {
        setState(() => _scrollPhysics = AlwaysScrollableScrollPhysics());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> service = [
      S.of(context).guide,
      S.of(context).service,
      S.of(context).kontak,
      S.of(context).information,
      S.of(context).domestic,
      S.of(context).international,
      S.of(context).opportunity,
      S.of(context).program,
      S.of(context).report
    ];
    return Scaffold(
      body: Container(
        color: Color(0xFF27405E),
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(parent: _scrollPhysics),
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/db-bg-x3.png",
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50, right: 24),
                          child: InkWell(
                            onTap: isLogin == false
                                ? () {
                                    setState(() {
                                      SharedPreferencesHelper.clearAllData();
                                    });
                                    Navigator.pushNamed(context, '/login');
                                    // Navigator.pushNamed(context, '/carousel');
                                  }
                                : () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF27405E),
                                  borderRadius: BorderRadius.circular(5)),
                              width: MediaQuery.of(context).size.width * 0.30,
                              height: 30,
                              child: Center(
                                child: Text(
                                  isLogin == true
                                      ? "${S.of(context).welcome}, $name"
                                      : S.of(context).loginRegister,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                Container(
                  color: Color(0xFF27405E),
                  padding: EdgeInsets.all(20),
                  child: Material(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (ctx, i) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: i == 4 || i == 5
                                    ? CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.transparent,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Image.asset(
                                            icons[i],
                                            fit: BoxFit.fill,
                                            color: Color(0xFF27405E),
                                          ),
                                        ),
                                      )
                                    : CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.transparent,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Icon(
                                            icons[i],
                                            size: 50,
                                            color: Color(0xFF27405E),
                                          ),
                                        ),
                                      ),
                                onTap: () {
                                  setState(() {
                                    SharedPreferencesHelper.saveIsSelected(
                                        isSelected);
                                  });
                                  _navigateRoute(service[i]);
                                },
                              ),
                              Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width * 0.20,
                                decoration: BoxDecoration(
                                    color: Color(0xFF27405E),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    service[i],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Text(
                //     "#CenterOfSmartCollaboration",
                //     style: TextStyle(color: Color(0xFF27405E)),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF27405E),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.indigoAccent,
        onTap: (value) {
          if (value == 1) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MubaTv()));
          } else if (value == 2) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Settings()));
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

  _navigateRoute(routeName) {
    if (isLogin == true || routeName == S.of(context).information) {
      if (routeName == S.of(context).kontak) {
        return Navigator.pushNamed(context, '/kontak');
      }
      if (routeName == S.of(context).guide) {
        return Navigator.pushNamed(context, '/panduan');
      }
      if (routeName == S.of(context).service) {
        return Navigator.pushNamed(context, '/layanan');
      }
      if (routeName == S.of(context).information) {
        return Navigator.pushNamed(context, '/berita');
      }
      if (routeName == S.of(context).domestic) {
        return Navigator.pushNamed(context, '/domestik');
      }
      if (routeName == S.of(context).international) {
        return Navigator.pushNamed(context, '/inter');
      }
      if (routeName == S.of(context).opportunity) {
        return Navigator.pushNamed(context, '/peluang');
      }
      if (routeName == S.of(context).program) {
        return Navigator.pushNamed(context, '/program');
      }
      if (routeName == S.of(context).report) {
        return Navigator.pushNamed(context, '/laporan');
      }
    } else {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                backgroundColor: Color(0xFF27405E),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: Container(
                    child: Text(
                  S.of(context).pleaseLogin,
                  style: TextStyle(color: Colors.white),
                )),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              ));
    }
  }
}
