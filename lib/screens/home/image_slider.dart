// ignore_for_file: camel_case_types

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  "assets/images/vocal4local.png",
  "assets/images/grab.jfif",
  "assets/images/deals.jfif"
];

class Image_slider extends StatelessWidget {
  const Image_slider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imgList
          .map((e) => Center(
                child: Image.asset(
                  e,
                  fit: BoxFit.cover,
                ),
              ))
          .toList(),
      options: CarouselOptions(),
    );
  }
}
