import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/peluang_model.dart';
import 'package:muba/view/page_index_konten/peluang_kerjasama/peluang_kerjasama_konten.dart';

class TabbarviewDalam extends StatefulWidget {
  final List<PeluangModel> dataPeluang;
  const TabbarviewDalam({Key? key, required this.dataPeluang})
      : super(key: key);

  @override
  _TabbarviewDalamState createState() => _TabbarviewDalamState();
}

class _TabbarviewDalamState extends State<TabbarviewDalam> {
  @override
  void initState() {
    super.initState();
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
                widget.dataPeluang.length,
                (index) => Container(
                  child: widget.dataPeluang[index].negara_id == "1"
                      ? Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => KontenPeluang(
                                              title: widget
                                                  .dataPeluang[index].judul,
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
                                          "https://muba.socketspace.com/${widget.dataPeluang[index].file.substring(1, widget.dataPeluang[index].file.length)}")),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                height: 100,
                                child: Text(
                                  widget.dataPeluang[index].judul,
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
