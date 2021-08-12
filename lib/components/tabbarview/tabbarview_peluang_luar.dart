import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/peluang_model.dart';
import 'package:muba/view/page_index_konten/peluang_kerjasama/peluang_kerjasama_konten.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;

class TabbarviewLuar extends StatefulWidget {
  const TabbarviewLuar({Key? key}) : super(key: key);

  @override
  _TabbarviewLuarState createState() => _TabbarviewLuarState();
}

class _TabbarviewLuarState extends State<TabbarviewLuar> {
  List<PeluangModel> peluangModel = [];
  bool isLoaded = false;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    loadData().onError((error, stackTrace) {
      setState(() {
        isError = true;
      });
    }).then((value) {
      setState(() {});
      peluangModel = value;
    }).whenComplete(() {
      setState(() {});
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverPadding(padding: const EdgeInsets.only(top: 50)),
            SliverList(
              delegate: SliverChildListDelegate(List.generate(
                peluangModel.length,
                (index) => Container(
                  child: peluangModel[index].negara_id == "2"
                      ? Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => KontenPeluang(
                                              title:
                                                  "${peluangModel[index].jenis != null ? peluangModel[index].jenis : "Error"}",
                                              index: index,
                                            )));
                              },
                              child: Container(
                                width: 350,
                                padding:
                                    const EdgeInsets.only(left: 20, top: 43),
                                decoration: BoxDecoration(
                                  color: Color(0xFF42A5F5),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.4),
                                          BlendMode.srcOver),
                                      image: NetworkImage(peluangModel[index]
                                                  .url !=
                                              null
                                          ? "https://muba.socketspace.com/${peluangModel[index].url!.substring(1, peluangModel[index].url!.length)}"
                                          : "https://muba.socketspace.com/uploads/peluang/logo.jpg")),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                height: 100,
                                child: Text(
                                  "${peluangModel[index].jenis != null ? peluangModel[index].jenis : "Error"}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 36),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                          ],
                        )
                      : Container(),
                ),
              ).toList()),
            ),
          ],
        ));
  }

  Future integrateAPI() async {
    final queryParameter = {'negara_id': '2'};
    final uri = Uri.https(
        'muba.socketspace.com', '/api/peluang_kerjasama', queryParameter);
    // String apiURL =
    //     "https://muba.socketspace.com/api/peluang_kerjasama/?negara_id=1";
    var response = await http.get(uri);
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
    ListPeluang listModel = ListPeluang.fromJson(jsonRespone);
    return listModel.peluang;
  }
}
