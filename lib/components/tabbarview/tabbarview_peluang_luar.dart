import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/peluang_model.dart';
import 'package:muba/utilities/const.dart';
import 'package:muba/view/page_index_konten/peluang_kerjasama/peluang_kerjasama_konten.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;

class TabbarviewLuar extends StatefulWidget {
  const TabbarviewLuar({Key? key}) : super(key: key);

  @override
  _TabbarviewLuarState createState() => _TabbarviewLuarState();
}

class _TabbarviewLuarState extends State<TabbarviewLuar>
    with AutomaticKeepAliveClientMixin {
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
    super.build(context);
    return isError == false
        ? Container(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: isLoaded == true
                ? CustomScrollView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
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
                                                  builder: (context) =>
                                                      KontenPeluang(
                                                        peluangModel:
                                                            peluangModel,
                                                        title: getJenis(
                                                                peluangModel)[
                                                            index],
                                                        index: index,
                                                      )));
                                        },
                                        child: index <
                                                getJenis(peluangModel).length
                                            ? Container(
                                                width: 350,
                                                padding: const EdgeInsets.only(
                                                    left: 20, top: 43),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF42A5F5),
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                              Colors.black
                                                                  .withOpacity(
                                                                      0.4),
                                                              BlendMode
                                                                  .srcOver),
                                                      image: NetworkImage(getJenis(
                                                                      peluangModel)[
                                                                  index] !=
                                                              "Not Found!"
                                                          ? "${Constants.baseUri}${getUrl(peluangModel)[index].substring(1, getUrl(peluangModel)[index].length)}"
                                                          : "https://muba.socketspace.com/uploads/logo/6e064f7e7a6905924ea83c4d78cb9b43.png")),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                height: 100,
                                                child: Text(
                                                  "${getJenis(peluangModel)[index]}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 36),
                                                ),
                                              )
                                            : Container(),
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
                  )
                : Center(
                    child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      color: Color(0xFF27405E),
                      strokeWidth: 8,
                      backgroundColor: Colors.transparent,
                    ),
                  )))
        : Container(
            child: CustomScrollView(
            scrollDirection: Axis.vertical,
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              CupertinoSliverRefreshControl(
                onRefresh: () {
                  return loadData().onError((error, stackTrace) {
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
                },
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Text("Error Internet?"),
                ),
              ),
            ],
          ));
  }

  Future integrateAPI() async {
    final queryParameter = {'negara_id': '2'};
    final uri = Uri.https(
        '${Constants.urlMuba}', '/api/peluang_kerjasama', queryParameter);
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

  List<String> getJenis(List<PeluangModel>? peluangModel) {
    List<String> result = [];
    peluangModel!.forEach((element) {
      if (element.jenis != null) {
        if (!result.contains(element.jenis!)) result.add(element.jenis!);
      }
      result.add("Not Found!");
    });
    return result;
  }

  List<String> getUrl(List<PeluangModel>? peluangModel) {
    List<String> result = [];
    peluangModel!.forEach((element) {
      if (element.url != null) {
        if (!result.contains(element.url)) result.add(element.url!);
      }
      result.add("Not Found!");
    });
    return result;
  }

  Future loadData() async {
    String jsonData = await integrateAPI();
    final jsonRespone = jsonDecode(jsonData);
    ListPeluang listModel = ListPeluang.fromJson(jsonRespone);
    return listModel.peluang;
  }

  @override
  bool get wantKeepAlive => true;
}
