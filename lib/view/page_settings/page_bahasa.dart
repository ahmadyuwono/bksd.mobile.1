import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/utilities/shared_preferences.dart';

class PageBahasa extends StatefulWidget {
  const PageBahasa({Key? key}) : super(key: key);

  @override
  _PageBahasaState createState() => _PageBahasaState();
}

class _PageBahasaState extends State<PageBahasa> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.readIsSelected().then((value) {
      setState(() {
        isSelected = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x0FF27405E),
        title: Center(
          child: Text(
            S.of(context).languageButton,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: CustomScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                              S.of(context).languageButton,
                              style: TextStyle(
                                  color:
                                      index == 0 ? Colors.grey : Colors.black,
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
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isSelected = false;
                                  SharedPreferencesHelper.saveIsSelected(false);
                                  SharedPreferencesHelper.saveLanguage("en");
                                });
                                S.load(Locale("en"));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "English",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  isSelected == false
                                      ? Icon(
                                          CupertinoIcons
                                              .check_mark_circled_solid,
                                          color: Color(0x0FF27405E),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 2,
                              color: Color(0x0FF27405E),
                            ),
                            SizedBox(
                              height: 38,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isSelected = true;
                                  SharedPreferencesHelper.saveIsSelected(true);
                                  SharedPreferencesHelper.saveLanguage("id");
                                });
                                S.load(Locale("id"));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Indonesia",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  isSelected == true
                                      ? Icon(
                                          CupertinoIcons
                                              .check_mark_circled_solid,
                                          color: Color(0x0FF27405E),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 2,
                              color: Color(0x0FF27405E),
                            ),
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
