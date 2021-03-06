import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:muba/components/tabbarview/tabbarview_peluang_dalam.dart';
import 'package:muba/components/tabbarview/tabbarview_peluang_luar.dart';
import 'package:muba/generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'package:muba/model/peluang_model.dart';

class PeluangKerjasama extends StatefulWidget {
  const PeluangKerjasama({Key? key}) : super(key: key);

  @override
  _PeluangKerjasamaState createState() => _PeluangKerjasamaState();
}

class _PeluangKerjasamaState extends State<PeluangKerjasama>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool isLoaded = false;
  bool isError = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 1, length: 2, vsync: this);
    _tabController!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27405E),
        title: Center(
          child: Text(
            S.of(context).opportunity,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        child: Column(
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
                isScrollable: true,
                tabs: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Tab(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/indo-icon.png",
                            color: _tabController!.index == 0
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
                            color: _tabController!.index == 1
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
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  TabbarviewDalam(),
                  TabbarviewLuar(),
                ],
              ),
            ),
          ],
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
    );
  }
}
