// ignore_for_file: camel_case_types, unused_local_variable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

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
    return ImageSlideshow(
      width: mQWidth,
      autoPlayInterval: 3000,
      isLoop: true,
      children: [
        InkWell(
            onTap: () {},
            child: Image.asset(
              imgList[0],
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            )),
        InkWell(
            onTap: () {},
            child: Image.asset(
              imgList[1],
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            )),
        InkWell(
            onTap: () {},
            child: Image.asset(
              imgList[2],
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            )),
        InkWell(
            onTap: () {},
            child: Image.asset(
              imgList[3],
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            )),
        InkWell(
            onTap: () {},
            child: Image.asset(
              imgList[4],
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            )),
      ],
    );
  }
}
