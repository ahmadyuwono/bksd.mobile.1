import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:muba/components/listview/listview_informasi_kerjasama.dart';
import 'package:muba/model/berita_model.dart';
import 'package:muba/view/home.dart';
import 'package:progress_dialog/progress_dialog.dart';

class InformasiKerjasama extends StatefulWidget {
  const InformasiKerjasama({Key? key}) : super(key: key);

  @override
  _InformasiKerjasamaState createState() => _InformasiKerjasamaState();
}

class _InformasiKerjasamaState extends State<InformasiKerjasama> {
  @override
  void initState() {
    super.initState();
    loadData().then((value) {
      setState(() {});
      beritaModel = value;
    }).whenComplete(() {
      setState(() {});
      isLoaded = true;
    });
  }

  List<BeritaModel> beritaModel = [];
  bool isLoaded = false;
  late ProgressDialog loading;

  @override
  Widget build(BuildContext context) {
    loading = ProgressDialog(context,
        customBody: LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            Color(0xFF27405E),
          ),
          backgroundColor: Colors.transparent,
        ),
        type: ProgressDialogType.Download,
        isDismissible: false);
    loading.style(
        message: 'Mohon tunggu',
        borderRadius: 10,
        elevation: 10,
        insetAnimCurve: Curves.elasticInOut,
        progress: 0,
        maxProgress: 100,
        progressTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        backgroundColor: Colors.transparent);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27405E),
        title: Center(
          child: Text(
            "Informasi Kerja Sama",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20),
        child: isLoaded == true
            ? CustomScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                slivers: [
                  SliverPadding(padding: const EdgeInsets.only(top: 24)),
                  SliverList(
                    delegate: SliverChildListDelegate(List.generate(
                        beritaModel.length,
                        (index) => ListInformasiSama(
                            headLine: beritaModel, index: index)).toList()),
                  ),
                ],
              )
            : Center(
                child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  color: Color(0xFF27405E),
                  strokeWidth: 8,
                  backgroundColor: Colors.transparent,
                ),
              )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF27405E),
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              activeIcon: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Beranda()));
                },
                icon: Icon(Icons.home),
              ),
              icon: Icon(Icons.home),
              label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: "Muba TV"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  Future integrateAPI() async {
    String apiURL = "https://muba.socketspace.com/api/berita";
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
    ListModel listModel = ListModel.fromJson(jsonRespone);
    return listModel.berita;
  }
}
