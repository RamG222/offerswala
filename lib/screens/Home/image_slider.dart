import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:offerswala/screens/Home/homepage.dart';

class imageSlider extends StatelessWidget {
  const imageSlider({
    super.key,
    required this.mQHeight,
    required this.mQWidth,
  });

  final double mQHeight;
  final double mQWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mQHeight / 3.5,
      decoration: BoxDecoration(
        color: containerBackgroundColor,
      ),
      child: ImageSlideshow(
        autoPlayInterval: 3000,
        isLoop: true,
        children: [
          InkWell(
            onTap: () {
              print('object');
            },
            child: Image.asset(
              'assets/images/image_slider/1.jpg',
              width: mQWidth,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          InkWell(
            onTap: () {
              print('object');
            },
            child: Image.asset(
              'assets/images/image_slider/2.jpg',
              width: mQWidth,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          InkWell(
            onTap: () {
              print('object');
            },
            child: Image.asset(
              'assets/images/image_slider/3.jpg',
              width: mQWidth,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          InkWell(
            onTap: () {
              print('object');
            },
            child: Image.asset(
              'assets/images/image_slider/4.jpg',
              width: mQWidth,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          InkWell(
            onTap: () {
              print('object');
            },
            child: Image.asset(
              'assets/images/image_slider/5.jpg',
              width: mQWidth,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
