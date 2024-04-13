import 'package:flutter/material.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'All Categories',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: mQHeight / 40,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: mQHeight / 40,
          ),
          SizedBox(
            width: mQWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Accessory.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Accessory',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Agriculture.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Agriculture',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Architect.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Architect',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Apparels.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Apparels',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Beauty-Spa.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Spa',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: mQHeight / 40),
          SizedBox(
            width: mQWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Chemists.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Chemists',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Computer.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Computer',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Consulatants.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Consultants',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Doctors.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Doctors',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Education.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Education',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: mQHeight / 40),
          SizedBox(
            width: mQWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Electronics.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Electronics',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Entertainment.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        'Entertainment',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Fashion.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Fashion',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Finance.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Finance',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Furniture.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Furniture',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: mQHeight / 40),
          SizedBox(
            width: mQWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Gift Shops.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Gift Shops',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Grocery.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Grocery',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Hospital.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Hospital',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Hotels.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Hotel',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Jewellery.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Jewellery',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: mQHeight / 40),
          SizedBox(
            width: mQWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Kids Fashion.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Kids Fashion',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Mobile.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Mobile',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Night Life.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Night Life',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Pet Shops.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Pet shop',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Sports.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Sports',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: mQHeight / 40),
          SizedBox(
            width: mQWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Stationary.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Stationary',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Toys.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Toys',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Transports.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Transports',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/icons/categories/Wedding.png",
                        width: mQWidth / 7,
                      ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        'Wedding',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mQWidth / 5,
                  child: Column(
                    children: [
                      // Image.asset(
                      //   "assets/images/icons/categories/Beauty-Spa.png",
                      //   width: mQWidth / 7,
                      // ),
                      SizedBox(
                        height: mQHeight / 100,
                      ),
                      Text(
                        '',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
