import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:muba/components/custom_dialog.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/peluang_model.dart';
import 'package:muba/utilities/const.dart';

class KontenPeluang extends StatefulWidget {
  final String title;
  final int index;
  final List<PeluangModel> peluangModel;
  const KontenPeluang({
    Key? key,
    required this.title,
    required this.index,
    required this.peluangModel,
  }) : super(key: key);

  @override
  _KontenPeluangState createState() => _KontenPeluangState();
}

class _KontenPeluangState extends State<KontenPeluang> {
  TextEditingController _textEditingController = TextEditingController();
  String? _fileName;
  String? basename;
  @override
  Widget build(BuildContext context) {
    _fileName = widget.peluangModel[widget.index].file!
        .substring(18, widget.peluangModel[widget.index].file!.length);
    // print(_fileName);
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
                  widget.peluangModel.length,
                  (index) => Column(
                    children: [
                      widget.peluangModel[index].jenis != null
                          ? widget.peluangModel[index].jenis == widget.title
                              ? widget.peluangModel[index].judul
                                      .toLowerCase()
                                      .contains(_textEditingController.text
                                          .trim()
                                          .toLowerCase())
                                  ? InkWell(
                                      onTap: () {
                                        print(
                                          "${Constants.baseUri}${widget.peluangModel[index].file!.substring(1, widget.peluangModel[index].file!.length)}",
                                        );
                                        showDialog(
                                            context: context,
                                            builder: (_) => CustomDialog(
                                                fileName: basename = widget
                                                    .peluangModel[index].file!
                                                    .substring(widget
                                                            .peluangModel[index]
                                                            .file!
                                                            .lastIndexOf("/") +
                                                        1),
                                                url:
                                                    "${Constants.baseUri}${widget.peluangModel[index].file!.substring(1, widget.peluangModel[index].file!.length)}",
                                                title:
                                                    S.of(context).dialogTitleP,
                                                unduhFile:
                                                    "${widget.peluangModel[index].judul}"));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.80,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              colorFilter: ColorFilter.mode(
                                                  Colors.black.withOpacity(0.4),
                                                  BlendMode.srcOver),
                                              image: NetworkImage(widget
                                                                  .peluangModel[
                                                                      index]
                                                                  .file !=
                                                              null &&
                                                          widget
                                                              .peluangModel[
                                                                  index]
                                                              .file!
                                                              .contains(
                                                                  "png") ||
                                                      widget.peluangModel[index]
                                                          .file!
                                                          .contains("jpg")
                                                  ? "${Constants.baseUri}${widget.peluangModel[index].file!.substring(1, widget.peluangModel[index].file!.length)}"
                                                  : "${Constants.baseUri}/uploads/peluang/logo.jpg")),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.35,
                                        child: Center(
                                          child: Text(
                                            widget.peluangModel[index].judul,
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container()
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
