import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:muba/components/custom_snackbar.dart';
import 'package:muba/components/form_register_field.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/services/auth_service.dart';
import 'package:muba/utilities/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:muba/view/home.dart';
import 'package:muba/view/muba_tv.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> menu = [];
  late String selectedLang;
  bool isLogin = false;
  String token = "";
  String oldPass = "";
  String newPass = "";
  String id = "";
  int _status = 0;

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.readLanguage().then((value) {
      setState(() => S.load(Locale(value)));
    });
    SharedPreferencesHelper.readIsLogin().then((value) {
      setState(() => isLogin = value);
    });
    SharedPreferencesHelper.readToken().then((value) {
      setState(() => token = value);
      print(value);
    });
    SharedPreferencesHelper.readId().then((value) {
      setState(() => id = value);
      print(value);
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
    final snackBar = SnackBar(
        content: Text(S.of(context).passChanged),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            Navigator.pop(context);
          },
        ));
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
                                      if (index == 1) {
                                        selectedLang =
                                            await _navigate(menu[index]);
                                      } else {
                                        await _navigate(menu[index]);
                                      }
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
            ),
            SliverToBoxAdapter(
              child: isLogin == true
                  ? Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 100, height: 40),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(5),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0x0FF27405E)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                          onPressed: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (_) => Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.30,
                                      width: MediaQuery.of(context).size.width *
                                          0.30,
                                      child: AlertDialog(
                                        backgroundColor: Color(0x0FF27405E),
                                        title: Text(
                                          S.of(context).changePass,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        content: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.20,
                                          child: Column(
                                            children: [
                                              FieldFormReg(
                                                hintForm: S.of(context).oldPass,
                                                isPassword: true,
                                                onFilled: (value) {
                                                  setState(() {});
                                                  oldPass = value;
                                                },
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              FieldFormReg(
                                                hintForm: S.of(context).newPass,
                                                isPassword: true,
                                                onFilled: (value) {
                                                  setState(() {});
                                                  newPass = value;
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                  S.of(context).dialogCancel)),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          ElevatedButton(
                                            child:
                                                Text(S.of(context).changePass),
                                            onPressed: () async {
                                              EasyLoading.show(
                                                  status:
                                                      S.of(context).pleaseWait);
                                              // await AuthService.updatePassword(
                                              //     newPass);
                                              integrateAPI(id, oldPass, newPass,
                                                      token)
                                                  .whenComplete(() {
                                                if (_status == 200) {
                                                  Navigator.of(context).pop();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                }
                                                EasyLoading.dismiss();
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ));
                          },
                          child: Text(
                            S.of(context).changePass,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontSize: 11),
        unselectedLabelStyle: TextStyle(fontSize: 11),
        currentIndex: 2,
        backgroundColor: Color(0xFF27405E),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.indigoAccent,
        onTap: (value) {
          if (value == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (value == 1) {
            Navigator.pushNamed(context, '/tv');
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

  Future integrateAPI(
      String id, String oldPass, String newPass, String token) async {
    String apiURL = "https://muba.socketspace.com/api/user/password/$id";
    var response = await http.put(Uri.parse(apiURL), headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "old_password": "$oldPass",
      "new_password": "$newPass",
    });
    if (response.statusCode == 200) {
      print(response.statusCode);
      setState(() => _status = response.statusCode);
      return response.body;
    } else {
      print(response.statusCode);
      throw Exception('Failed');
    }
  }
}
