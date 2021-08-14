import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:muba/components/custom_alert_dialog.dart';
import 'package:muba/components/form_tahap_persiapan/dasar_hukum.dart';
import 'package:muba/components/form_tahap_persiapan/korespondensi.dart';
import 'package:muba/components/form_tahap_persiapan/premis_rectal.dart';
import 'package:muba/components/form_tahap_persiapan/rencana_pelaksanaan.dart';
import 'package:muba/components/form_tahap_persiapan/subjek_hukum.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/persiapan_model.dart';
import 'package:muba/utilities/shared_preferences.dart';
import 'package:muba/view/page_index_konten/layanan_kerjasama/form_tahap_persiapan_complete.dart';

class TahapanPersiapan extends StatefulWidget {
  final String title;
  final String title2;
  final String fasilitas;
  final String jenis;
  const TahapanPersiapan(
      {Key? key,
      required this.title,
      required this.title2,
      required this.fasilitas,
      required this.jenis})
      : super(key: key);

  @override
  _TahapanPersiapanState createState() => _TahapanPersiapanState();
}

class _TahapanPersiapanState extends State<TahapanPersiapan> {
  String namaDaerah = "";
  String namaKepalaDaerah = "";
  String nomorSK = "";
  String alamat = "";
  String undangUndang = "";
  String peraturanPemerintah = "";
  String peraturanPresiden = "";
  String peraturanMenteri = "";
  String peraturanDaerah = "";
  String pertimbangan = "";
  String maksud = "";
  String tujuan = "";
  String objekKerjasama = "";
  String ruangLingkup = "";
  String pelaksanaan = "";
  String alamatSurat = "";
  String email = "";
  String no = "";
  String namaNarahubung = "";
  String jabatan = "";
  String user_id = "";
  String atasNama = "";
  String jangkaWaktu = "";
  String pembiayaan = "";
  String token = "";
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.readId().then((value) {
      setState(() {
        user_id = value;
        print(user_id);
      });
    });
    SharedPreferencesHelper.readToken().then((value) {
      setState(() {});
      token = value;
      print(token);
    });
    print(widget.fasilitas);
    print(widget.jenis);
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
                              "${S.of(context).stepTitle}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(S.of(context).formStepT),
                            SizedBox(
                              height: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SubjekHukum(
                      a: (value) {
                        setState(() {});
                        print(value);
                        namaDaerah = value;
                      },
                      b: (value) {
                        setState(() {});
                        namaKepalaDaerah = value;
                      },
                      c: (value) {
                        setState(() {});
                        nomorSK = value;
                      },
                      d: (value) {
                        setState(() {});
                        alamat = value;
                      },
                      e: (value) {
                        setState(() {});
                        atasNama = value;
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: DasarHukum(
                      a: (value) {
                        setState(() {});
                        print(value);
                        undangUndang = value;
                      },
                      b: (value) {
                        setState(() {});
                        peraturanPemerintah = value;
                      },
                      c: (value) {
                        setState(() {});
                        peraturanPresiden = value;
                      },
                      d: (value) {
                        setState(() {});
                        peraturanMenteri = value;
                      },
                      e: (value) {
                        setState(() {});
                        peraturanDaerah = value;
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: PremisRectal(a: (value) {
                      setState(() {});
                      print(value);
                      pertimbangan = value;
                    }, b: (value) {
                      setState(() {});
                      maksud = value;
                    }, c: (value) {
                      setState(() {});
                      tujuan = value;
                    }, d: (value) {
                      setState(() {});
                      objekKerjasama = value;
                    }, e: (value) {
                      setState(() {});
                      ruangLingkup = value;
                    }),
                  ),
                  SliverToBoxAdapter(
                    child: RencanaPelaksanaan(
                      a: (value) {
                        setState(() {});
                        pelaksanaan = value;
                      },
                      b: (value) {
                        setState(() {});
                        jangkaWaktu = value;
                      },
                      c: (value) {
                        setState(() {});
                        pembiayaan = value;
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Korespondensi(
                      a: (value) {
                        setState(() {});
                        alamatSurat = value;
                      },
                      b: (value) {
                        setState(() {});
                        email = value;
                      },
                      c: (value) {
                        setState(() {});
                        no = value;
                      },
                      d: (value) {
                        setState(() {});
                        namaNarahubung = value;
                      },
                      e: (value) {
                        setState(() {});
                        jabatan = value;
                      },
                    ),
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
                                _validateForm();
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             TahapPersiapanComplete(
                                //               title: widget.title2,
                                //             )));
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
    EasyLoading.show(status: S.of(context).pleaseWait);
    if (namaDaerah.isNotEmpty) {
      _integrateAPI();
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

  _integrateAPI() {
    PersiapanModel.integrateAPI(
            token,
            widget.fasilitas,
            widget.jenis,
            namaDaerah,
            namaKepalaDaerah,
            nomorSK,
            alamat,
            undangUndang,
            peraturanPemerintah,
            peraturanPresiden,
            peraturanMenteri,
            peraturanDaerah,
            pertimbangan,
            maksud,
            tujuan,
            objekKerjasama,
            ruangLingkup,
            pelaksanaan,
            alamatSurat,
            email,
            no,
            namaNarahubung,
            jabatan,
            user_id,
            atasNama,
            jangkaWaktu,
            pembiayaan)
        .whenComplete(() {
      EasyLoading.dismiss();
    });
  }
}
