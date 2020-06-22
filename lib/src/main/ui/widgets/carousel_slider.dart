import 'package:digitalkaimur/src/main/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FullscreenSlider extends StatefulWidget {
  @override
  _FullscreenSliderState createState() => _FullscreenSliderState();
}

class _FullscreenSliderState extends State<FullscreenSlider> {
  int _current = 0;

  List<String> imgList = Global.imgList;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Silder(),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color(0xffFF2400)
                        : Color(0xffFFFFFF),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget Silder() {
    return Builder(
      builder: (context) {
        final double height = MediaQuery.of(context).size.height;
        return CarouselSlider(
          options: CarouselOptions(
              height: height / 4.5,
              autoPlay: true,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: imgList
              .map((item) => Container(
                    child: Center(
                        child: Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )),
                  ))
              .toList(),
        );
      },
    );
  }
}
