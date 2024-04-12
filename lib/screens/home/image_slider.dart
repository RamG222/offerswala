// ignore_for_file: camel_case_types

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  "assets/images/image_slider/1.jpg",
  "assets/images/image_slider/2.jpg",
  "assets/images/image_slider/3.jpg",
  "assets/images/image_slider/4.jpg",
  "assets/images/image_slider/5.jpg",
];

class Image_slider extends StatelessWidget {
  const Image_slider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    return CarouselSlider(
      items: imgList
          .map((src) => TextButton(
                onPressed: () {},
                child: Center(
                  child: Image.asset(
                    src,
                    fit: BoxFit.cover,
                  ),
                ),
              ))
          .toList(),
      options: CarouselOptions(
        height: mQHeight / 6,
        autoPlay: true,
      ),
    );
  }
}
