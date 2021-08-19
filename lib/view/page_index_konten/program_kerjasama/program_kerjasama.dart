import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muba/components/tabbarview/tabbarview_proker_dalam.dart';
import 'package:muba/components/tabbarview/tabbarview_proker_luar.dart';
import 'package:muba/generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'package:muba/model/program_model.dart';
import 'package:muba/utilities/const.dart';

class ProgramKerjasama extends StatefulWidget {
  const ProgramKerjasama({Key? key}) : super(key: key);

  @override
  _ProgramKerjasamaState createState() => _ProgramKerjasamaState();
}

class _ProgramKerjasamaState extends State<ProgramKerjasama>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<ProgramModel> programModel = [];
  bool isLoaded = false;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 1, length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    loadData().onError((error, stackTrace) {
      setState(() {
        isError = true;
      });
    }).then((value) {
      setState(() {});
      programModel = value;
    }).whenComplete(() {
      setState(() {});
      isLoaded = true;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset("assets/images/bg-city.png"),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Color(0xFF27405E),
            title: Center(
              child: Text(
                S.of(context).program,
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          body: isError == false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width,
                      constraints: BoxConstraints(maxHeight: 50),
                      child: TabBar(
                        controller: _tabController,
                        unselectedLabelColor: Colors.grey,
                        labelColor: Color(0xFF27405E),
                        isScrollable: false,
                        tabs: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Tab(
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/indo-icon.png",
                                    color: _tabController.index == 0
                                        ? Color(0xFF27405E)
                                        : Colors.grey,
                                  ),
                                  Text(
                                    S.of(context).dalamNegeri,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Tab(
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/world-icon.png",
                                    color: _tabController.index == 1
                                        ? Color(0xFF27405E)
                                        : Colors.grey,
                                  ),
                                  Text(
                                    S.of(context).luarNegeri,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 4,
                            color: Color(0xFF27405E),
                          ),
                        ),
                        indicatorWeight: 4,
                      ),
                    ),
                    isLoaded == true
                        ? Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                TabbarviewProkerDalam(
                                  programModel: programModel,
                                ),
                                TabbarviewProkerLuar(
                                  programModel: programModel,
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 200),
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: CircularProgressIndicator(
                                color: Color(0xFF27405E),
                                strokeWidth: 8,
                                backgroundColor: Colors.transparent,
                              ),
                            )),
                  ],
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
                            isError = true;
                          });
                        }).then((value) {
                          setState(() {});
                          programModel = value;
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
                )),
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

  Future integrateAPI() async {
    String apiURL = "${Constants.baseUri}/api/agenda";
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
    ListProgram listModel = ListProgram.fromJson(jsonRespone);
    return listModel.program;
  }
}
