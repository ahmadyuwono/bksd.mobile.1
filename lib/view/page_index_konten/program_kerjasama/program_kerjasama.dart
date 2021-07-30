import 'package:flutter/material.dart';
import 'package:muba/components/tabbarview/tabbarview_proker_dalam.dart';
import 'package:muba/components/tabbarview/tabbarview_proker_luar.dart';

class ProgramKerjasama extends StatefulWidget {
  const ProgramKerjasama({Key? key}) : super(key: key);

  @override
  _ProgramKerjasamaState createState() => _ProgramKerjasamaState();
}

class _ProgramKerjasamaState extends State<ProgramKerjasama>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 1, length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
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
            title: Text(
              "Program Kerja Sama",
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
          body: Column(
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
                              color: _tabController.index == 0
                                  ? Color(0xFF27405E)
                                  : Colors.grey,
                            ),
                            Text(
                              "Dalam Negeri",
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
                              "Luar Negeri",
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
                    TabbarviewProkerDalam(),
                    TabbarviewProkerLuar(),
                  ],
                ),
              ),
            ],
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
      ],
    );
  }
}
