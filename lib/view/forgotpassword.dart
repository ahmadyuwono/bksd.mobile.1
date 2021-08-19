import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:muba/components/custom_alert_dialog.dart';
import 'package:muba/components/form_register_field.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/user_model.dart';
import 'package:muba/services/auth_service.dart';
import 'package:muba/utilities/const.dart';
import 'package:muba/utilities/shared_preferences.dart';
import 'package:muba/view/loginscreen.dart';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isLogin = false;
  String email = "";
  String password = "";
  int _status = 0;
  List<UserModel>? userModel;
  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.readIsLogin().then((value) {
      setState(() {
        isLogin = value;
      });
    });
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..userInteractions = false
      ..backgroundColor = Colors.transparent
      ..indicatorColor = Color(0x0FF27405E)
      ..textColor = Color(0x0FF27405E);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/image-background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xFF9E9E9E)])),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40))),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(40)),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF27405E), Color(0xFF0B2340)],
                    )),
              ),
              title: Center(
                child: Text(
                  S.of(context).forgotPassword,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 313),
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  children: [
                    FieldFormReg(
                      hintForm: 'E-mail',
                      isPassword: false,
                      onFilled: (value) {
                        setState(() {});
                        email = value;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FieldFormReg(
                      hintForm: S.of(context).newPass,
                      isPassword: true,
                      onFilled: (value) {
                        setState(() {});
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 41,
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                          color: Color(0xFF27405E),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: InkWell(
                        onTap: () {
                          EasyLoading.show(status: S.of(context).pleaseWait);
                          integrateAPI().whenComplete(() {
                            EasyLoading.dismiss();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Color(0x0FF27405E),
                                content: Text(S.of(context).passChanged),
                                action: SnackBarAction(
                                  label: 'OK',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )));
                          });
                          // Navigator.pushNamed(context, '/login');
                          // await AuthService.forgotPassword(email);
                        },
                        child: Text(
                          S.of(context).sendForgot,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        S.of(context).registeredBack,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color(0xFF27405E),
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.white,
              onTap: (value) {
                if (value == 0) {
                  Navigator.pushNamed(context, '/home');
                } else if (value == 1) {
                  Navigator.pushNamed(context, '/tv');
                } else if (value == 2) {
                  Navigator.pushNamed(context, '/settings');
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
          ),
        ),
      ],
    );
  }

  Future integrateAPI() async {
    String apiURL = "${Constants.baseUri}/api/user/forgot_password";
    var response = await http.put(Uri.parse(apiURL), body: {
      "email": email,
      "new_password": password,
    });
    if (response.statusCode == 200) {
      print(response.statusCode);
      return response.body;
    } else {
      print(response.statusCode);
      setState(() => _status = response.statusCode);
      throw Exception('Failed');
    }
  }
}
