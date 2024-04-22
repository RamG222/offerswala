import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories_view extends StatelessWidget {
  const Categories_view({
    super.key,
    required this.mQWidth,
    required this.mQHeight,
  });

  final double mQWidth;
  final double mQHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
      child: Column(
        children: [
          // Categories Scrolling Widget
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: mQWidth / 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Catergories_Scrolling_widget(
                  mQWidth: mQWidth,
                  mQHeight: mQHeight,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
          SizedBox(
            width: 5,
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Apparels',
            src: 'assets/images/icons/categories/Apparel.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Beverages',
            src: 'assets/images/icons/categories/Beverages.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Education',
            src: 'assets/images/icons/categories/Education.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Entertainment',
            src: 'assets/images/icons/categories/Entertainment.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Finance',
            src: 'assets/images/icons/categories/Finance.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Furniture',
            src: 'assets/images/icons/categories/Furniture.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Hotels',
            src: 'assets/images/icons/categories/Hotels.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Jwellery',
            src: 'assets/images/icons/categories/Jewellery.png',
          ),
          Category_box(
            mQWidth: mQWidth,
            text: 'Restaurants',
            src: 'assets/images/icons/categories/Restaurants.png',
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
    return Card(
      surfaceTintColor: Colors.white,
      color: Colors.white,
      margin: EdgeInsets.all(8),
      elevation: 5,
      child: InkWell(
        onTap: () {
          Get.snackbar('Tapped on', text + ' Category');
        },
        child: SizedBox(
          width: mQWidth / 5,
          height: mQWidth / 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                src,
                width: 40,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
