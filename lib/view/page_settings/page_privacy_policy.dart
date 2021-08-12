import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';

class PagePrivacy extends StatefulWidget {
  const PagePrivacy({Key? key}) : super(key: key);

  @override
  _PagePrivacyState createState() => _PagePrivacyState();
}

class _PagePrivacyState extends State<PagePrivacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x0FF27405E),
        title: Center(
          child: Text(
            "Privacy Policy",
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
                              "Privacy Policy",
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
                            Text("App Privacy Policy\n"),
                            Text("Last updated 5/08/2021\n"),
                            Text("Lorem Ipsum")
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
