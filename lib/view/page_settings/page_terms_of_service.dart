import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'package:muba/model/regulation_model.dart';

class PageTerms extends StatefulWidget {
  const PageTerms({Key? key}) : super(key: key);

  @override
  _PageTermsState createState() => _PageTermsState();
}

class _PageTermsState extends State<PageTerms> {
  RegulationModel? regulationModel;
  @override
  void initState() {
    integrateAPI().then((value) {
      setState(() {
        regulationModel = value[0];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x0FF27405E),
        title: Center(
          child: Text(
            "Terms of Service",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: regulationModel == null
          ? Center(
              child: CircularProgressIndicator(
                color: Color(0x0FF27405E),
              ),
            )
          : Container(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: CustomScrollView(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                slivers: [
                  SliverPadding(padding: const EdgeInsets.only(top: 42)),
                  SliverList(
                    delegate: SliverChildListDelegate(List.generate(
                        1,
                        (index) => Container(
                              padding: const EdgeInsets.only(bottom: 38),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Terms of Service",
                                    style: TextStyle(
                                        color: index == 0
                                            ? Colors.grey
                                            : Colors.black,
                                        fontSize: 18,
                                        fontWeight: index == 0
                                            ? FontWeight.w700
                                            : FontWeight.w400),
                                  ),
                                  Divider(
                                    thickness: 3,
                                    color: Color(0x0FF27405E),
                                  ),
                                  SizedBox(
                                    height: 38,
                                  ),
                                  Text("Last updated " +
                                      regulationModel!.registryDate.toString()),
                                  Text(regulationModel!.attachment),
                                ],
                              ),
                            ))),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        backgroundColor: Color(0xFF27405E),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.indigoAccent,
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

Future<List<RegulationModel>> integrateAPI() async {
  String apiURL = "https://muba.socketspace.com/api/termofservice";
  var response = await http.get(Uri.parse(apiURL));
  if (response.statusCode == 200) {
    print(response.statusCode);
    return regulationFromJson(response.body);
  } else {
    print(response.statusCode);
    throw Exception('Failed');
  }
}

List<RegulationModel> regulationFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<RegulationModel>.from(
      data.map((item) => RegulationModel.fromJson(item)));
}
