import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Brands_View extends StatelessWidget {
  const Brands_View({
    super.key,
    required this.mQWidth,
    required this.mQHeight,
  });

  final double mQWidth;
  final double mQHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(
        children: [
          // Categories Scrolling Widget
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Top Brands',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Brands_Scrolling_widget(
                  mQWidth: mQWidth,
                  mQHeight: mQHeight,
                ),
                Padding(
                  padding: EdgeInsets.only(left: mQWidth / 1.5),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All >',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Brands_Scrolling_widget extends StatelessWidget {
  const Brands_Scrolling_widget({
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
          SizedBox(
            width: 5,
          ),
          Brand_box(
            mQWidth: mQWidth,
            src: 'assets/images/icons/brands/Hanuman.png',
          ),
          Brand_box(
            mQWidth: mQWidth,
            src: 'assets/images/icons/brands/Rajhans.png',
          ),
          Brand_box(
            mQWidth: mQWidth,
            src: 'assets/images/icons/brands/Sai Sales.png',
          ),
          Brand_box(
            mQWidth: mQWidth,
            src: 'assets/images/icons/brands/Sangli Properties.png',
          ),
          Brand_box(
            mQWidth: mQWidth,
            src: 'assets/images/icons/brands/SFC.png',
          ),
          Brand_box(
            mQWidth: mQWidth,
            src: 'assets/images/icons/brands/Soham Mobile.png',
          ),
        ],
      ),
    );
  }
}

class Brand_box extends StatelessWidget {
  const Brand_box({
    super.key,
    required this.mQWidth,
    required this.src,
  });

  final double mQWidth;
  final String src;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      color: Colors.white,
      margin: EdgeInsets.all(8),
      elevation: 5,
      child: InkWell(
        onTap: () {
          Get.snackbar('OffersWala', 'Branded Deals');
        },
        child: SizedBox(
          width: mQWidth / 5,
          height: mQWidth / 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                src,
                width: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}