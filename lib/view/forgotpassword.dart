import 'package:flutter/material.dart';
import 'package:muba/components/form_register_field.dart';
import 'package:muba/view/home.dart';
import 'package:muba/view/loginscreen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                  "Forgot Password",
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
                      hintForm: 'Email',
                      isPassword: false,
                      onFilled: (value) {},
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                        name: (value) {},
                                      )));
                        },
                        child: Text(
                          "Kirim",
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
                        "Kembali ke Login",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
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
