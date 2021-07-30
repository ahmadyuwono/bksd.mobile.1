import 'package:flutter/material.dart';

class TabbarviewProkerDalam extends StatefulWidget {
  const TabbarviewProkerDalam({Key? key}) : super(key: key);

  @override
  _TabbarviewProkerDalamState createState() => _TabbarviewProkerDalamState();
}

class _TabbarviewProkerDalamState extends State<TabbarviewProkerDalam> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 49, right: 31),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverPadding(padding: const EdgeInsets.only(top: 47)),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  height: 100,
                  child: Card(
                    semanticContainer: true,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xFF27405E),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      padding: const EdgeInsets.only(left: 18, right: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/document.png"),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  contentList[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF27405E),
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  contentList[index].date,
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }, childCount: contentList.length),
          )
        ],
      ),
    );
  }
}

class ContentList {
  final String title;
  final String date;
  const ContentList({required this.title, required this.date});
}

List<ContentList> contentList = [
  ContentList(
      title: "EVALUASI KERJA SAMA DAERAH DENGAN DAERAH", date: "tahun 2021"),
  ContentList(
      title: "EVALUASI KERJA SAMA DAERAH DENGAN DAERAH", date: "tahun 2021"),
  ContentList(
      title: "EVALUASI KERJA SAMA DAERAH DENGAN DAERAH", date: "tahun 2021"),
];
