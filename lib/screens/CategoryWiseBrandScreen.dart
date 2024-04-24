import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

var brandName = [
  'Natraj Annex',
  'New Hanuman Executive',
  'Ajwaa Restaurant',
  'Hotel Sarovar',
  'Rahamatullah Restaurant',
];
var imageURL = [
  'assets/images/brand/Natraj Annex.png',
  'assets/images/brand/New Hanuman.jpg',
  'assets/images/brand/Ajwaa.jpg',
  'assets/images/brand/Sarovar.jpg',
  'assets/images/brand/Rahamatullah.jpg',
];
var ratings = [
  4.1,
  1.0,
  2.0,
  3.0,
  5.0,
];
var address = [
  'Opp. Dileep Tyres pushpraj chowk, south Shivaji nagar, Sangli, Maharashtra 416416',
  'Opp. Dileep Tyres pushpraj chowk, south Shivaji nagar, Sangli, Maharashtra 416416',
  'Opp. Dileep Tyres pushpraj chowk, south Shivaji nagar, Sangli, Maharashtra 416416',
  'Opp. Dileep Tyres pushpraj chowk, south Shivaji nagar, Sangli, Maharashtra 416416',
  'Opp. Dileep Tyres pushpraj chowk, south Shivaji nagar, Sangli, Maharashtra 416416',
];
var isVeg = [
  true,
  true,
  false,
  true,
  false,
];
var offerID = [
  0,
  1,
  2,
  3,
  4,
];
var noOfVisits = [
  413,
  500,
  75,
  310,
  1002,
];

class CategoryWiseBrandScreen extends StatefulWidget {
  const CategoryWiseBrandScreen({super.key, required this.Category});
  final String Category;

  @override
  State<CategoryWiseBrandScreen> createState() =>
      _CategoryWiseBrandScreenState();
}

class _CategoryWiseBrandScreenState extends State<CategoryWiseBrandScreen> {
  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    return Scaffold(
        backgroundColor: Color(0xffEFEFEF),
        body: Column(
          children: [
            SizedBox(height: mQHeight / 15),
            Center(
              child: Text(
                'Top Deals on ${widget.Category}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: brandName.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color.fromARGB(255, 245, 250, 244),
                    elevation: 5,
                    child: InkWell(
                      onTap: () {
                        Get.snackbar('Tapped on ', '${brandName[index]} card');
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: mQHeight / 7,
                            child: Container(
                              color: Colors.white,
                              // First Row Main
                              child: Row(
                                children: [
                                  //first child image
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      '${imageURL[index]}',
                                      width: mQWidth / 3.5,
                                      height: mQHeight / 8.5,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  //second child column
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //title
                                        SizedBox(
                                          width: mQWidth / 1.75,
                                          child: Text(
                                            brandName[index],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                        //ratings
                                        Row(
                                          children: [
                                            Text('${ratings[index]}'),
                                            SizedBox(width: 2),
                                            RatingBarIndicator(
                                              rating: ratings[index],
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 12.0,
                                            ),
                                          ],
                                        ),
                                        //Address
                                        SizedBox(
                                          width: mQWidth / 1.7,
                                          child: Text(
                                            '${address[index]}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            softWrap: true,
                                            maxLines: 2,
                                          ),
                                        ),
                                        SizedBox(height: mQHeight / 230),
                                        //Veg or Non Veg Image
                                        isVeg[index]
                                            ? Image.asset(
                                                'assets/images/icons/veg.png',
                                                width: mQWidth / 20,
                                              )
                                            : Image.asset(
                                                'assets/images/icons/non-veg.png',
                                                width: mQWidth / 20,
                                              )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Second Row Main
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${noOfVisits[index]} people visited',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.snackbar(
                                          'Item Name', 'Added to Favorites');
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'Add to Favorites',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Icon(
                                          Icons.favorite_border,
                                          color: Colors.red,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
