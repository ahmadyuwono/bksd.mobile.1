import 'package:flutter/material.dart';
import 'package:muba/components/form_register_field.dart';
import 'package:muba/model/register_model.dart';
import 'package:muba/view/home.dart';
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
  String negara = "";
  String email = "";
  String password = "";
  String konfirmPassword = "";

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
                  "Registrasi BKSD Kab. Muba",
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
                  children: [
                    FieldFormReg(
                      hintForm: 'NIK',
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
                      hintForm: 'Nama Lengkap',
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
                      hintForm: 'Alamat',
                      isPassword: false,
                      onFilled: (value) {
                        setState(() {});
                        alamat = value;
                      },
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    FieldFormReg(
                      hintForm: 'Negara',
                      isPassword: false,
                      onFilled: (value) {
                        setState(() {});
                        negara = value;
                      },
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    FieldFormReg(
                      hintForm: 'E-mail',
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
                      hintForm: 'Password',
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
                      hintForm: 'Konfirm Password',
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
                          width: 335,
                          height: 30,
                          child: Text(
                            "Saya menyetujui Term dan Privacy Policy dari layanan BKSD Kab. Muba",
                            style: TextStyle(color: Colors.black, fontSize: 13),
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
                        onTap: () {
                          if (isChecked == true) {
                            RegisterModel.integrateAPI(nik, namaLengkap, email,
                                    password, negara, "1")
                                .then((value) {
                              setState(() {});
                              registerModel = value;
                            }).whenComplete(() {
                              registerModel != null &&
                                      nik.length >= 16 &&
                                      namaLengkap.isNotEmpty &&
                                      alamat.isNotEmpty &&
                                      negara.isNotEmpty &&
                                      regExp.hasMatch(email) &&
                                      password.length >= 8 &&
                                      konfirmPassword == password
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen(
                                                name: (value) {},
                                              )))
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
                                              "Data Belum Lengkap, Mohon Dicek Kembali",
                                              style: TextStyle(
                                                  color: Colors.white),
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
                            });
                          }
                        },
                        child: Text(
                          "Daftar",
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
                              TextSpan(text: "Sudah Daftar ? "),
                              TextSpan(
                                text: "Kembali ke Login",
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
              fixedColor: Colors.white,
              unselectedItemColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                    activeIcon: IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Beranda()));
                      },
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
