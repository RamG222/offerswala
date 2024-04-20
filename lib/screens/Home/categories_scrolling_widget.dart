import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Catergories_Scrolling_widget extends StatelessWidget {
  const Catergories_Scrolling_widget({
    super.key,
    required this.mQWidth,
    required this.mQHeight,
  });
  final double mQWidth;
  final double mQHeight;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Category_box(
            mQWidth: mQWidth,
            text: 'Accessory',
            src: 'assets/images/icons/categories/Accessory.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Apparels',
            src: 'assets/images/icons/categories/Apparels.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Computer',
            src: 'assets/images/icons/categories/Computer.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Doctors',
            src: 'assets/images/icons/categories/Doctors.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Hospital',
            src: 'assets/images/icons/categories/Hospital.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Hotels',
            src: 'assets/images/icons/categories/Hotels.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Mobile',
            src: 'assets/images/icons/categories/Mobile.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Sports',
            src: 'assets/images/icons/categories/Sports.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Toys',
            src: 'assets/images/icons/categories/Toys.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Transports',
            src: 'assets/images/icons/categories/Transports.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Wedding',
            src: 'assets/images/icons/categories/Wedding.png',
          ),
        ],
      ),
    );
  }
}

class Category_box extends StatelessWidget {
  const Category_box({
    super.key,
    required this.mQWidth,
    required this.text,
    required this.src,
  });

  final double mQWidth;
  final String text;
  final String src;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(
            height: 6,
          ),
          Image.asset(
            src,
            width: mQWidth / 6,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
