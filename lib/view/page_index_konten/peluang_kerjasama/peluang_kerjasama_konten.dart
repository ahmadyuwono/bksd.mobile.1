import 'package:flutter/material.dart';
import 'package:muba/components/custom_dialog.dart';
import 'package:muba/generated/l10n.dart';

class KontenPeluang extends StatefulWidget {
  final String title;
  final int index;
  const KontenPeluang({Key? key, required this.title, required this.index})
      : super(key: key);

  @override
  _KontenPeluangState createState() => _KontenPeluangState();
}

class _KontenPeluangState extends State<KontenPeluang> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27405E),
        title: Center(
          child: Text(
            "${widget.title}",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: CustomScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverPadding(padding: const EdgeInsets.only(top: 18)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 27, bottom: 41),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: _textEditingController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 14, right: 12),
                        border: InputBorder.none,
                        hintText: "Cari",
                        alignLabelWithHint: true,
                        suffixIcon: InkWell(
                          child: Image.asset("assets/images/search-alt.png"),
                        )),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                List.generate(
                  listKonten.length,
                  (index) => Column(
                    children: [
                      listKonten[index].category == widget.title
                          ? listKonten[index].name.toLowerCase().contains(
                                  _textEditingController.text
                                      .trim()
                                      .toLowerCase())
                              ? InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => CustomDialog(
                                            title: S.of(context).dialogTitleP,
                                            unduhFile:
                                                "${listKonten[index].name}"));
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.80,
                                    height: 70,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: Color(0xFF27405E),
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 27),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                listKonten[index].images),
                                            SizedBox(
                                              width: 24,
                                            ),
                                            Text(
                                              listKonten[index].name,
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container()
                          : Container(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
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
    );
  }
}

class ListKonten {
  final String name;
  final String images;
  final String category;
  const ListKonten(
      {required this.images, required this.name, required this.category});
}

List<ListKonten> listKonten = [
  ListKonten(
      images: "assets/images/icon-school.png",
      name: "SDN 1 Kab. Muba",
      category: "Pendidikan"),
  ListKonten(
      images: "assets/images/icon-school.png",
      name: "SDN 1 Kab. Muba",
      category: "Pendidikan"),
  ListKonten(
      images: "assets/images/icon-school.png",
      name: "SDN 1 Kab. Muba",
      category: "Pendidikan"),
  ListKonten(
      images: "assets/images/icon-school.png",
      name: "SDN 5 Kab. Muba",
      category: "Pendidikan"),
  ListKonten(
      images: "assets/images/icon-school.png",
      name: "SDN 6 Kab. Muba",
      category: "Pendidikan"),
];
