import 'package:flutter/material.dart';
import 'package:muba/components/tabbarview_peluang_dalam.dart';
import 'package:muba/components/tabbarview_peluang_luar.dart';

class PeluangKerjasama extends StatefulWidget {
  const PeluangKerjasama({Key? key}) : super(key: key);

  @override
  _PeluangKerjasamaState createState() => _PeluangKerjasamaState();
}

class _PeluangKerjasamaState extends State<PeluangKerjasama>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27405E),
        title: Text("Peluang Kerja Sama"),
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
                Tab(
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
                Tab(
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
                )
              ],
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2,
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
    );
  }
}
