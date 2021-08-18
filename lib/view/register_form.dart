import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:muba/components/custom_alert_dialog.dart';
import 'package:muba/components/form_register_field.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/register_model.dart';
import 'package:muba/services/auth_service.dart';
import 'package:muba/utilities/shared_preferences.dart';
import 'package:muba/view/loginscreen.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool? isChecked = false;
  RegisterModel? registerModel;
  final regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  String nik = "";
  String namaLengkap = "";
  String alamat = "";
  String? negara;
  String email = "";
  String password = "";
  String konfirmPassword = "";
  bool isPressed = false;
  List kodeNegara = ["1", "2"];

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.readLanguage().then((value) {});
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..userInteractions = false
      ..backgroundColor = Colors.transparent
      ..indicatorColor = Color(0x0FF27405E)
      ..textColor = Color(0x0FF27405E);
  }

  @override
  Widget build(BuildContext context) {
    List kodeNegara = [
      "1 (${S.of(context).domestic})",
      "2 (${S.of(context).international})"
    ];
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
                  S.of(context).registerTitle,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 59),
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FieldFormReg(
                      hintForm: 'NIK (16 digit)',
                      isPassword: false,
                      onFilled: (value) {
                        setState(() {});
                        nik = value;
                      },
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    FieldFormReg(
                      hintForm: S.of(context).completeName,
                      isPassword: false,
                      onFilled: (value) {
                        setState(() {});
                        namaLengkap = value;
                      },
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    FieldFormReg(
                      hintForm: S.of(context).address,
                      isPassword: false,
                      onFilled: (value) {
                        setState(() {});
                        alamat = value;
                      },
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down_sharp),
                          focusColor: Colors.white,
                          value: negara,
                          items: <String>[
                            '1 (${S.of(context).dalamNegeri})',
                            '2 (${S.of(context).luarNegeri})'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black54),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {});
                            negara = value.toString();
                            print(negara);
                          },
                          hint: Text(
                            S.of(context).country,
                            style:
                                TextStyle(fontSize: 24, color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    FieldFormReg(
                      hintForm: 'E-mail (example@mail.com)',
                      isPassword: false,
                      onFilled: (value) {
                        setState(() {});
                        email = value;
                      },
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    FieldFormReg(
                      hintForm: 'Password (8 digit minimal)',
                      isPassword: true,
                      onFilled: (value) {
                        setState(() {});
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    FieldFormReg(
                      hintForm: S.of(context).confirmPass,
                      isPassword: true,
                      onFilled: (value) {
                        setState(() {});
                        konfirmPassword = value;
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: Color(0xFF27405E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {});
                              isChecked = value;
                            }),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: Text(
                            S.of(context).agreeCheck,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                          color: isChecked == true
                              ? Color(0xFF27405E)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: InkWell(
                        onTap: isPressed == false
                            ? () {
                                setState(() {});
                                if (isChecked == true) {
                                  EasyLoading.show(
                                      status: S.of(context).pleaseWait);
                                  isPressed = true;
                                  _validateForm();
                                }
                              }
                            : () {},
                        child: Text(
                          S.of(context).registerButton,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                    ),
                    Container(
                      width: 250,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            children: [
                              TextSpan(text: S.of(context).registered),
                              TextSpan(
                                text: S.of(context).registeredBack,
                                style: TextStyle(
                                    color: Color(0xFF27405E),
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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

  _validateForm() {
    if (nik.length >= 16 &&
        namaLengkap.isNotEmpty &&
        alamat.isNotEmpty &&
        negara!.isNotEmpty &&
        regExp.hasMatch(email) &&
        password.length >= 8 &&
        konfirmPassword == password) {
      RegisterModel.integrateAPI(
              nik, namaLengkap, email, password, negara!, "1")
          .then((value) {
        setState(() {});
        registerModel = value;
      }).whenComplete(() {
        setState(() {});
        isPressed = false;
        EasyLoading.dismiss();
        registerModel != null
            ? Navigator.pushNamed(context, '/login')
            : showDialog(
                context: context,
                builder: (_) =>
                    CustomAlert(title: S.of(context).registerCheck));
      });
    } else {
      showDialog(
          context: context,
          builder: (_) => CustomAlert(title: S.of(context).registerCheck));
      EasyLoading.dismiss();
      setState(() {
        isPressed = false;
      });
    }
  }

  // _signUp() async {
  //   if (nik.length >= 16 &&
  //       namaLengkap.isNotEmpty &&
  //       alamat.isNotEmpty &&
  //       negara.isNotEmpty &&
  //       regExp.hasMatch(email) &&
  //       password.length >= 8 &&
  //       konfirmPassword == password) {
  //     await AuthService.signUp(email, password);
  //   }
  // }
}
