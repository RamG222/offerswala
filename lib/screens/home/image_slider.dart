// ignore_for_file: camel_case_types

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  "assets/images/Vocal_for_Local.png",
  "assets/images/Offers _Discounts.png",
  "assets/images/Grab_Save.png"
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
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    e,
                    fit: BoxFit.cover,
                  ),
                ),
              ))
          .toList(),
      options: CarouselOptions(),
    );
  }
}
