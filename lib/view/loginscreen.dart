import 'package:flutter/material.dart';
import 'package:muba/components/form_register_field.dart';
import 'package:muba/components/password_field.dart';
import 'package:muba/model/login_model.dart';
import 'package:muba/utilities/shared_preferences.dart';
import 'package:muba/view/forgotpassword.dart';
import 'package:muba/view/home.dart';
import 'package:muba/view/register_form.dart';

class LoginScreen extends StatefulWidget {
  final Function(String) name;
  const LoginScreen({Key? key, required this.name}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _username = "";
  String _password = "";
  int _statusCode = 0;
  LoginModel? loginModel;

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
                          _username = value;
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
                          _password = value;
                        },
                        hintForm: 'Password'),
                    SizedBox(
                      height: 36,
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                          color: Color(0xFF27405E),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            LoginModel.integrateAPI(_username, _password).then(
                                (value) {
                              setState(() {});
                              if (value.status != 0) {
                                SharedPreferencesHelper.saveName(value.name);
                                SharedPreferencesHelper.saveIsLogin(true);
                              }
                              widget.name(value.name);
                              loginModel = value;
                            }).whenComplete(() => loginModel!.status != 0
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Beranda()))
                                : showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          backgroundColor: Color(0xFF27405E),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          title: Container(
                                              child: Text(
                                            "Login gagal! User tidak ditemukan!",
                                            style:
                                                TextStyle(color: Colors.white),
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
                                        )));
                          },
                          child: Text(
                            "Login",
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()));
                          },
                          child: Text(
                            "Lupa Password",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterForm()));
                          },
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color(0xFF27405E),
              fixedColor: Colors.white,
              unselectedItemColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                    activeIcon: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Beranda()));
                      },
                      icon: Icon(Icons.home),
                    ),
                    icon: Icon(Icons.home),
                    label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.tv), label: "Muba TV"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
