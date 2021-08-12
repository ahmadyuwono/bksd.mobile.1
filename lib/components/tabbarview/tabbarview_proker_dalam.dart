import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muba/model/program_model.dart';

class TabbarviewProkerDalam extends StatefulWidget {
  final List<ProgramModel> programModel;
  const TabbarviewProkerDalam({Key? key, required this.programModel})
      : super(key: key);

  @override
  _TabbarviewProkerDalamState createState() => _TabbarviewProkerDalamState();
}

class _TabbarviewProkerDalamState extends State<TabbarviewProkerDalam> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverPadding(
              padding: const EdgeInsets.only(top: 47, left: 49, right: 31)),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              width: 100,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.programModel.length,
                  itemBuilder: (BuildContext context, index) {
                    DateTime date =
                        DateTime.parse(widget.programModel[index].created_at);
                    String formattedDate =
                        DateFormat("dd MMMM yyyy").format(date);
                    return widget.programModel[index].negara_id == '0'
                        ? Container(
                            child: Align(
                              child: Container(
                                child: InkWell(
                                  onTap: () {},
                                  child: Card(
                                    semanticContainer: true,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Color(0xFF27405E),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 18, right: 25),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF42A5F5),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(0.4),
                                                BlendMode.srcOver),
                                            image: NetworkImage(
                                                "https://muba.socketspace.com/${widget.programModel[index].url.substring(1, widget.programModel[index].url.length)}")),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              "assets/images/document.png"),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  widget.programModel[index]
                                                      .judul,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                Text(
                                                  formattedDate,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container();
                  }),
            ),
          ),
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
