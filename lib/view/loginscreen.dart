import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:muba/components/custom_alert_dialog.dart';
import 'package:muba/components/form_register_field.dart';
import 'package:muba/components/password_field.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/login_model.dart';
import 'package:muba/model/user_model.dart';
import 'package:muba/services/auth_service.dart';
import 'package:muba/utilities/shared_preferences.dart';
import 'package:muba/view/forgotpassword.dart';
import 'package:muba/view/home.dart';
import 'package:muba/view/register_form.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  final Function(String) name;
  const LoginScreen({Key? key, required this.name}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _username = "";
  String _password = "";
  int _status = 0;
  bool isLoading = false;
  bool isLogin = false;
  bool isPressed = false;
  LoginModel? loginModel;
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
          "assets/images/bg_loginmuba.png",
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
                  "Login BKSD Kab. Muba",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 314),
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  children: [
                    FieldFormReg(
                      onFilled: (value) {
                        setState(() {
                          _username = value.trim();
                        });
                      },
                      hintForm: 'E-mail',
                      isPassword: false,
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    PasswordField(
                        text: (value) {
                          setState(() {});
                          _password = value.trim();
                        },
                        hintForm: 'Password'),
                    SizedBox(
                      height: 36,
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                          color: isPressed == false
                              ? Color(0xFF27405E)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: InkWell(
                          onTap: isPressed == false
                              ? () async {
                                  setState(() {
                                    isPressed = true;
                                  });
                                  EasyLoading.show(
                                      status: S.of(context).pleaseWait);
                                  // await AuthService.signIn(_username, _password)
                                  //     .whenComplete(() => _validateLogin());
                                  _validateLogin();
                                }
                              : () {},
                          child: Text(
                            S.of(context).loginButton,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              SharedPreferencesHelper.saveIsLogin(isLogin);
                            });
                            Navigator.pushNamed(context, '/forgot');
                          },
                          child: Text(
                            S.of(context).forgotPassword,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            S.of(context).register,
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedLabelStyle: TextStyle(fontSize: 11),
              unselectedLabelStyle: TextStyle(fontSize: 11),
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

  _validateLogin() {
    LoginModel.integrateAPI(_username, _password).then((value) {
      setState(() {});
      print(value.status);
      if (value.status != 0) {
        isLogin = true;
        SharedPreferencesHelper.saveName(value.name);
        SharedPreferencesHelper.saveIsLogin(isLogin);
        SharedPreferencesHelper.saveUsername(value.email);
        SharedPreferencesHelper.saveToken(value.token);
        SharedPreferencesHelper.saveId(value.user_id);
      }
      widget.name(value.name);
      loginModel = value;
    }).whenComplete(() {
      setState(() {});
      isPressed = false;
      EasyLoading.dismiss();
      loginModel != null
          ? Navigator.pushReplacementNamed(context, '/home')
          : showDialog(
              context: context,
              builder: (_) => CustomAlert(
                    title: S.of(context).loginFailed,
                  ));
    }).onError((error, stackTrace) {
      showToast("Error");
      EasyLoading.dismiss();
    });
  }

  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  // _deleteAccount(int status) async {
  //   if (userModel != null || _status != 503) {
  //     if (userModel!.indexWhere((element) => element.email == _username) ==
  //         -1) {
  //       await AuthService.deleteAccount().whenComplete(() {
  //         setState(() => isPressed == false);
  //         EasyLoading.dismiss();
  //       });
  //     }
  //   }
  // }

}
