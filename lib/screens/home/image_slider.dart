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
    return CarouselSlider(
      items: imgList
          .map((src) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    src,
                    fit: BoxFit.cover,
                  ),
                ),
              ))
          .toList(),
      options: CarouselOptions(),
    );
  }
}
