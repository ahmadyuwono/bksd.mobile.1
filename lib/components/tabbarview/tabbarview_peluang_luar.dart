import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/peluang_model.dart';
import 'package:muba/view/page_index_konten/peluang_kerjasama/peluang_kerjasama_konten.dart';

class TabbarviewLuar extends StatefulWidget {
  final List<PeluangModel> peluangModel;
  const TabbarviewLuar({Key? key, required this.peluangModel})
      : super(key: key);

  @override
  _TabbarviewLuarState createState() => _TabbarviewLuarState();
}

class _TabbarviewLuarState extends State<TabbarviewLuar> {
  List<String> title = [];
  List<String> images = [
    "assets/images/bg-pendidikan.png",
    "assets/images/bg-kesehatan.png",
    "assets/images/bg-pariwisata.png",
    "assets/images/bg-olahraga.png"
  ];
  @override
  Widget build(BuildContext context) {
    List<String> title = [
      S.of(context).education,
      S.of(context).health,
      S.of(context).tourism,
      S.of(context).sport
    ];
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
                widget.peluangModel.length,
                (index) => Container(
                  child: widget.peluangModel[index].negara_id != "1"
                      ? Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => KontenPeluang(
                                              title: title[index],
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
                                      image: NetworkImage(
                                          "https://muba.socketspace.com/${widget.peluangModel[index].file.substring(1, widget.peluangModel[index].file.length)}")),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                height: 100,
                                child: Text(
                                  widget.peluangModel[index].judul,
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
}
