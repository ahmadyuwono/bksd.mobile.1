import 'package:flutter/material.dart';
import 'package:muba/components/form_register_field.dart';
import 'package:muba/loginscreen.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool? isChecked = false;
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
              backgroundColor: Color(0xFF27405E),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40))),
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
                      hintForm: 'No. KTP',
                      isPassword: false,
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    FieldFormReg(
                      hintForm: 'Nama Lengkap',
                      isPassword: false,
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    FieldFormReg(
                      hintForm: 'Alamat',
                      isPassword: false,
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    FieldFormReg(
                      hintForm: 'Negara',
                      isPassword: false,
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    FieldFormReg(
                      hintForm: 'E-mail',
                      isPassword: false,
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    FieldFormReg(
                      hintForm: 'Password',
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    FieldFormReg(
                      hintForm: 'Konfirm Password',
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Checkbox(
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
                          color: Color(0xFF27405E),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
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
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color(0xFF27405E),
              fixedColor: Colors.white,
              unselectedItemColor: Colors.white,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
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
