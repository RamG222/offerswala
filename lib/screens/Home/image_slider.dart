import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
    required this.mQWidth,
    required this.mQHeight,
  });

  final double mQWidth;
  final double mQHeight;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ImageSlideshow(
        height: double.infinity,
        autoPlayInterval: 5100,
        isLoop: true,
        children: [
          InkWell(
            child: Image.asset(
              'assets/images/image_slider/1.jpg',
              fit: BoxFit.cover,
            ),
            onTap: () {
              Get.snackbar(
                'height' + mQHeight.toString(),
                'width' + mQWidth.toString(),
              );
            },
          ),
          InkWell(
            child: Image.asset(
              'assets/images/image_slider/2.jpg',
              fit: BoxFit.fill,
            ),
            onTap: () {
              Get.snackbar('OffersWala', 'Second Image is Pressed');
            },
          ),
          InkWell(
            child: Image.asset(
              'assets/images/image_slider/3.jpg',
              fit: BoxFit.cover,
            ),
            onTap: () {
              Get.snackbar('OffersWala', 'Third Image is Pressed');
            },
          ),
          InkWell(
            child: Image.asset(
              'assets/images/image_slider/4.jpg',
              fit: BoxFit.cover,
            ),
            onTap: () {
              Get.snackbar('OffersWala', 'Fourth Image is Pressed');
            },
          ),
          InkWell(
            child: Image.asset(
              'assets/images/image_slider/5.jpg',
              fit: BoxFit.cover,
            ),
            onTap: () {
              Get.snackbar('OffersWala', 'Fifth Image is Pressed');
            },
          ),
        ],
      ),
    );
  }
}
