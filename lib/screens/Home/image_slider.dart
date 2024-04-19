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
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: mQWidth / 30, vertical: mQHeight / 150),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ImageSlideshow(
          width: mQWidth,
          height: mQHeight / 4.1,
          autoPlayInterval: 5100,
          isLoop: true,
          children: [
            InkWell(
              child: Image.asset(
                'assets/images/image_slider/1.jpg',
                fit: BoxFit.cover,
              ),
              onTap: () {
                Get.snackbar('OffersWala', 'First Image is Pressed');
              },
            ),
            InkWell(
              child: Image.asset(
                'assets/images/image_slider/2.jpg',
                fit: BoxFit.cover,
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
      ),
    );
  }
}
