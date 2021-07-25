import 'package:flutter/material.dart';

class TabbarviewDalam extends StatefulWidget {
  const TabbarviewDalam({Key? key}) : super(key: key);

  @override
  _TabbarviewDalamState createState() => _TabbarviewDalamState();
}

class _TabbarviewDalamState extends State<TabbarviewDalam> {
  List<String> title = ["Pendidikan", "Kesehatan", "Pariwisata", "Olahraga"];
  List<String> images = [
    "assets/images/bg-pendidikan.png",
    "assets/images/bg-kesehatan.png",
    "assets/images/bg-pariwisata.png",
    "assets/images/bg-olahraga.png"
  ];

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
                images.length,
                (index) => Column(
                  children: [
                    Container(
                      width: 350,
                      padding: const EdgeInsets.only(left: 20, top: 43),
                      decoration: BoxDecoration(
                        color: Color(0xFF42A5F5),
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.4),
                                BlendMode.srcOver),
                            image: ExactAssetImage(images[index])),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 100,
                      child: Text(
                        title[index],
                        style: TextStyle(color: Colors.white, fontSize: 36),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ).toList()),
            ),
          ],
        ));
  }
}
