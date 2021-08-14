import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muba/components/card_verifikasi_berkas.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/persiapan_model.dart';
import 'package:muba/utilities/shared_preferences.dart';
import 'package:http/http.dart' as http;

class KerjasamaLuarNegeri extends StatefulWidget {
  const KerjasamaLuarNegeri({
    Key? key,
  }) : super(key: key);

  @override
  _KerjasamaLuarNegeriState createState() => _KerjasamaLuarNegeriState();
}

class _KerjasamaLuarNegeriState extends State<KerjasamaLuarNegeri> {
  List<PlatformFile>? _paths;
  String? _fileName;
  File? file;
  int length = 0;
  FilePickerResult? result;
  bool isVerified = false;
  bool isUploadPersiapan = false;
  bool isUploadPenawaran = false;
  bool isLogin = false;
  String token = "";
  String name = "";
  String userName = "";
  String id = "";
  List<PersiapanModel> persiapanModel = [];
  List<PersiapanModel> penawaranModel = [];
  bool isLoaded1 = false;
  bool isLoaded2 = false;
  bool isError1 = false;
  bool isError2 = false;

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.readIsLogin().then((value) {
      setState(() {
        isLogin = value;
      });
    });
    SharedPreferencesHelper.readToken().then((value) {
      setState(() {
        token = value;
      });
    });
    SharedPreferencesHelper.readName().then((value) {
      setState(() {
        name = value;
      });
    });
    SharedPreferencesHelper.readUsername().then((value) {
      userName = value;
    });
    SharedPreferencesHelper.readId().then((value) {
      setState(() {
        id = value;
      });
    });
    loadData().then((value) {
      setState(() {
        persiapanModel = value;
        print(persiapanModel);
      });
    }).whenComplete(() {
      setState(() {
        isLoaded1 = true;
      });
    }).onError((error, stackTrace) {
      setState(() {
        isError1 = true;
      });
    });
    loadData2().then((value) {
      setState(() {
        penawaranModel = value;
      });
    }).whenComplete(() {
      setState(() {
        isLoaded2 = true;
      });
    }).onError((error, stackTrace) {
      setState(() {
        isError2 = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27405E),
        title: Center(
          child: Text(
            S.of(context).domestic,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: isError1 == false && isError2 == false
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: isLoaded1 == true && isLoaded2 == true
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.only(left: 21, right: 21),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 13),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xFF27405E),
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF27405E),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                      ),
                                      width: 86,
                                      child: Center(
                                          child: Image.asset(
                                              "assets/images/user-avatar.png")),
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 13, bottom: 17),
                                      width: MediaQuery.of(context).size.width *
                                          0.60,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFF27405E),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text("${S.of(context).address} :"),
                                          Text(
                                              "Jalan Akasia Delphina No. 18 Bumi Panyawangan"),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text("E-mail :"),
                                          Text(userName),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 26,
                          ),
                          Text(
                            " ${S.of(context).fileID} :",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFF27405E),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 9),
                                  hintText: "DN-2021-00001",
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CardVerifikasiBerkas(
                              isVerified: isLogin,
                              image: "assets/images/card-membership.png",
                              title: S.of(context).registeredMember),
                          SizedBox(
                            height: 10,
                          ),
                          CardVerifikasiBerkas(
                              image: "assets/images/document.png",
                              title: S.of(context).uploadFiles,
                              isVerified: cekBerkas()),
                          SizedBox(
                            height: 10,
                          ),
                          CardVerifikasiBerkas(
                              isVerified: isVerified,
                              image: "assets/images/document-checklist.png",
                              title: S.of(context).verifyFiles),
                        ],
                      ),
                    )
                  : Center(
                      child: Container(
                          padding: const EdgeInsets.only(top: 150),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                              color: Color(0xFF27405E),
                              strokeWidth: 8,
                              backgroundColor: Colors.transparent,
                            ),
                          )),
                    ),
            )
          : Container(
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                slivers: [
                  CupertinoSliverRefreshControl(
                    onRefresh: () {
                      return loadData().onError((error, stackTrace) {
                        setState(() {
                          isError1 = true;
                        });
                      }).then((value) {
                        loadData2().whenComplete(() {
                          setState(() {
                            isLoaded2 = true;
                          });
                        }).then((value) {
                          setState(() {
                            penawaranModel = value;
                          });
                        });
                        setState(() {});
                        persiapanModel = value;
                      }).whenComplete(() {
                        setState(() {});
                        isLoaded1 = true;
                      });
                    },
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: Text("Error"),
                    ),
                  ),
                ],
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
    );
  }

  void _filePicker() async {
    try {
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: true,
        allowedExtensions: ['pdf'],
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      print(_paths!.first.extension);
      length = _paths!.length;
      _fileName =
          _paths != null ? _paths!.map((e) => e.name).toString() : "...";
    });
  }

  bool cekBerkas() {
    if (persiapanModel.contains(id) && penawaranModel.contains(id)) {
      if (persiapanModel[persiapanModel
                      .indexWhere((element) => element.userId == id)]
                  .isValidate ==
              "1" &&
          penawaranModel[penawaranModel
                      .indexWhere((element) => element.userId == id)]
                  .isValidate ==
              "1") {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future integrateAPI() async {
    String apiURL = "https://muba.socketspace.com/api/tahapan_persiapan";
    var response = await http.get(Uri.parse(apiURL));
    if (response.statusCode == 200) {
      print(response.statusCode);
      return response.body;
    } else {
      print(response.statusCode);
      throw Exception('Failed');
    }
  }

  Future loadData() async {
    String jsonData = await integrateAPI();
    final jsonRespone = jsonDecode(jsonData);
    ListPersiapan listModel = ListPersiapan.fromJson(jsonRespone);
    return listModel.persiapan;
  }

  Future integrateAPI2() async {
    String apiURL = "https://muba.socketspace.com/api/tahapan_penawaran";
    var response = await http.get(Uri.parse(apiURL));
    if (response.statusCode == 200) {
      print(response.statusCode);
      return response.body;
    } else {
      print(response.statusCode);
      throw Exception('Failed');
    }
  }

  Future loadData2() async {
    String jsonData = await integrateAPI();
    final jsonRespone = jsonDecode(jsonData);
    ListPersiapan listModel = ListPersiapan.fromJson(jsonRespone);
    return listModel.persiapan;
  }
  // Future _pdfViewer(String file) async {
  //   PDFDocument _pdfDocument = await PDFDocument.fromURL(file);
  //   return _pdfDocument;
  // }
}
