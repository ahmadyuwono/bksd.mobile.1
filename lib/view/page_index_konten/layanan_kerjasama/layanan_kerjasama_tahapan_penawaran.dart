import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:muba/components/custom_alert_dialog.dart';
import 'package:muba/components/form_tahapan_penawaran/form_tahapan_penawaran.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/penawaran_model.dart';
import 'package:muba/utilities/shared_preferences.dart';
import 'package:muba/view/page_index_konten/layanan_kerjasama/form_tahap_penawaran_complete.dart';

class TahapanPenawaran extends StatefulWidget {
  final String title;
  final String title2;
  final String fasilitas;
  final String jenis;
  const TahapanPenawaran(
      {Key? key,
      required this.title,
      required this.title2,
      required this.fasilitas,
      required this.jenis})
      : super(key: key);

  @override
  _TahapanPenawaranState createState() => _TahapanPenawaranState();
}

class _TahapanPenawaranState extends State<TahapanPenawaran> {
  String noSurat = "";
  String tanggalSurat = "";
  String penawaran = "";
  String kedudukan = "";
  String atasNama = "";
  String user_id = "";
  String token = "";
  bool isPressed = false;
  PenawaranModel? penawaranModel;
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

  @override
  void initState() {
    super.initState();
    print(widget.fasilitas);
    print(widget.jenis);
    SharedPreferencesHelper.readId().then((value) {
      setState(() {
        user_id = value;
        print(user_id);
      });
    });
    SharedPreferencesHelper.readToken().then((value) {
      setState(() {
        token = value;
        print(token);
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
        Container(
          color: Colors.amber,
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF27405E),
            title: Center(
              child: Text(
                widget.title,
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              color: Colors.amber,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                slivers: [
                  SliverPadding(padding: const EdgeInsets.only(top: 14)),
                  SliverToBoxAdapter(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              S.of(context).stepTitleOffer,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(S.of(context).formStepT),
                            SizedBox(
                              height: 52,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: FormPenawaran(a: (value) {
                      setState(() {
                        noSurat = value;
                        print(noSurat);
                      });
                    }, b: (value) {
                      setState(() {
                        tanggalSurat = value;
                        print(tanggalSurat);
                      });
                    }, c: (value) {
                      setState(() {
                        penawaran = value;
                        print(penawaran);
                      });
                    }, d: (value) {
                      setState(() {
                        kedudukan = value;
                        print(kedudukan);
                      });
                    }, e: (value) {
                      setState(() {
                        atasNama = value;
                        print(atasNama);
                      });
                    }),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          height: 55,
                          margin: const EdgeInsets.only(left: 85, right: 85),
                          decoration: BoxDecoration(
                              color: Color(0xFF27405E),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                EasyLoading.show(
                                    status: S.of(context).pleaseWait);
                                _validateForm();
                              },
                              child: Text(
                                S.of(context).sendForgot,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
      ],
    );
  }

  _validateForm() {
    if (noSurat.isNotEmpty &&
        tanggalSurat.isNotEmpty &&
        penawaran.isNotEmpty &&
        kedudukan.isNotEmpty &&
        atasNama.isNotEmpty) {
      PenawaranModel.integrateAPI(token, widget.fasilitas, widget.jenis,
              tanggalSurat, noSurat, penawaran, kedudukan, atasNama, user_id)
          .onError((error, stackTrace) {
        EasyLoading.dismiss();
        return showToast("Error");
      }).then((value) {
        if (value) {
          setState(() {});
          isPressed = false;
          EasyLoading.dismiss();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => FormPenawaranComplete(
                      title: widget.title2,
                    )),
          );
        } else {
          EasyLoading.dismiss();
          showToast("Coba lagi");
        }
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
}
