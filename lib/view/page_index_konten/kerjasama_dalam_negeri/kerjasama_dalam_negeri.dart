import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muba/components/card_verifikasi_berkas.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/kerjasama_model.dart';
import 'package:muba/model/persiapan_model.dart';
import 'package:muba/utilities/const.dart';
import 'package:muba/utilities/shared_preferences.dart';
import 'package:http/http.dart' as http;

class KerjasamaDalamNegeri extends StatefulWidget {
  const KerjasamaDalamNegeri({Key? key}) : super(key: key);

  @override
  _KerjasamaDalamNegeriState createState() => _KerjasamaDalamNegeriState();
}

class _KerjasamaDalamNegeriState extends State<KerjasamaDalamNegeri> {
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
  late KerjasamaModel kerjasamaModel;
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
      loadData(id).then((value) {
        setState(() {
          kerjasamaModel = value;
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
      body: isError1 == false
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: isLoaded1 == true
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
                                          Text("${S.of(context).address} :" +
                                              (kerjasamaModel.alamat != null
                                                  ? kerjasamaModel.alamat
                                                  : "-")),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text("E-mail :" +
                                              kerjasamaModel.email),
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
                                  hintText: kerjasamaModel.berkasId != null
                                      ? kerjasamaModel.berkasId
                                      : "",
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CardVerifikasiBerkas(
                            image: "assets/images/document.png",
                            title: S.of(context).uploadFiles +
                                " " +
                                S.of(context).prepPhase.toUpperCase(),
                            isVerified: kerjasamaModel.validatePersiapan != null
                                ? true
                                : false,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CardVerifikasiBerkas(
                              isVerified:
                                  kerjasamaModel.validatePersiapan == "2"
                                      ? true
                                      : false,
                              image: "assets/images/document-checklist.png",
                              title: S.of(context).verifyFiles),
                          SizedBox(
                            height: 10,
                          ),
                          CardVerifikasiBerkas(
                            image: "assets/images/document.png",
                            title: S.of(context).uploadFiles +
                                " " +
                                S.of(context).offerPhase.toUpperCase(),
                            isVerified: kerjasamaModel.validatePenawaran != null
                                ? true
                                : false,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CardVerifikasiBerkas(
                              isVerified:
                                  kerjasamaModel.validatePenawaran == "2"
                                      ? true
                                      : false,
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
                      return loadData(id).onError((error, stackTrace) {
                        setState(() {
                          isError1 = true;
                        });
                      }).then((value) {
                        setState(() {});
                        kerjasamaModel = value;
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

  Future integrateAPI(String idUser) async {
    String apiURL = "${Constants.baseUri}/api/kerjasama/?user_id=" + idUser;
    var response = await http.get(Uri.parse(apiURL));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
      print('Failed');
    }
  }

  Future loadData(String idUser) async {
    print(idUser + "iduser");
    String jsonData = await integrateAPI(idUser);
    Map<String, dynamic> jsonRespone = jsonDecode(jsonData);

    KerjasamaModel kerjasamaModel = KerjasamaModel.fromJson(jsonRespone);
    print(jsonRespone["validate_persiapan"]);
    return kerjasamaModel;
  }
}

// InkWell(
//   splashColor: Colors.transparent,
//   focusColor: Colors.transparent,
//   hoverColor: Colors.transparent,
//   highlightColor: Colors.transparent,
//   onTap: () {
//     length > 0
//         ? showDialog(
//             context: context,
//             builder: (_) => Container(
//                   height: 300,
//                   width: 200,
//                   child: AlertDialog(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     backgroundColor: Color(0x0FF27405E),
//                     actions: [
//                       IconButton(
//                         icon: Icon(Icons.close),
//                         color: Colors.white,
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                       )
//                     ],
//                     title: Text(
//                       S.of(context).uploadedFiles,
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     content: Container(
//                       height: 200,
//                       width: 200,
//                       child: CustomScrollView(
//                         physics: BouncingScrollPhysics(
//                             parent:
//                                 AlwaysScrollableScrollPhysics()),
//                         slivers: [
//                           SliverList(
//                             delegate: SliverChildListDelegate(
//                                 List.generate(
//                                     _paths!.length,
//                                     (index) => Dismissible(
//                                           key: Key(_paths![index]
//                                               .toString()),
//                                           onDismissed:
//                                               (direction) {
//                                             setState(() {
//                                               _paths!.removeAt(
//                                                   index);
//                                               length =
//                                                   _paths!.length;
//                                               if (length == 0) {
//                                                 Navigator.of(
//                                                         context)
//                                                     .pop();
//                                               }
//                                             });
//                                           },
//                                           child: Column(
//                                             children: [
//                                               Container(
//                                                 child: Text(
//                                                   "${_paths![index].name}",
//                                                   style: TextStyle(
//                                                       color: Colors
//                                                           .white),
//                                                 ),
//                                               ),
//                                               Divider(
//                                                 color:
//                                                     Colors.white,
//                                                 thickness: 2,
//                                               )
//                                             ],
//                                           ),
//                                         ))),
//                           ),
//                           SliverToBoxAdapter(
//                             child: ElevatedButton(
//                               style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.all(
//                                           Colors.blueGrey)),
//                               onPressed: () {
//                                 setState(() {
//                                   _paths!.clear();
//                                   length = _paths!.length;
//                                 });
//                                 _filePicker();
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text(
//                                 S.of(context).reUpload,
//                                 style: TextStyle(
//                                     color: Colors.white),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ))
//         : _filePicker();
//   },
//   child: CardVerifikasiBerkas(
//       isVerified: length > 0 ? true : false,
//       image: "assets/images/document.png",
//       title: length > 0
//           ? S.of(context).lookFiles
//           : S.of(context).uploadFiles),
// ),
