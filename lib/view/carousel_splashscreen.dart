import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:muba/view/carousel_item_splashscreen/item_0.dart';
import 'package:muba/view/carousel_item_splashscreen/item_1.dart';
import 'package:muba/view/carousel_item_splashscreen/item_2.dart';
import 'package:muba/view/carousel_item_splashscreen/item_3.dart';

class CarouselSplash extends StatefulWidget {
  const CarouselSplash({Key? key}) : super(key: key);

  @override
  _CarouselSplashState createState() => _CarouselSplashState();
}

class _CarouselSplashState extends State<CarouselSplash> {
  int _currentIndex = 0;

  List itemList = [
    Item0(),
    Item1(),
    Item2(),
    Item3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverPadding(padding: const EdgeInsets.only(top: 100)),
          SliverToBoxAdapter(
            child: CarouselSlider(
              items: itemList.map((listItem) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.80,
                      width: MediaQuery.of(context).size.width,
                      child: listItem,
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 0.9,
                scrollPhysics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                onPageChanged: (int, value) {
                  setState(() => _currentIndex = int);
                },
                autoPlay: false,
                enableInfiniteScroll: false,
                height: MediaQuery.of(context).size.height * 0.80,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: itemList.map(
                (image) {
                  int index = itemList.indexOf(image); //are changed
                  return Container(
                    width: 15.0,
                    height: 15.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Color(0x0FF27405E)
                            : Colors.grey),
                  );
                },
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}
