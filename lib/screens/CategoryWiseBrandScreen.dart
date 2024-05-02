import 'package:auto_size_text/auto_size_text.dart';
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
  'Gandhi Nagar,Vishrambag,Sangli,Sangli Miraj Kupwad, Maharashtra 416415',
  'Bust Stop, Jai bhavan, Nishant Colony,Sangli, Maharashtra 416416',
  'Shri Complex, 100 feet Rd,Haripriya nagar,Vishrambag, Sangli, Maharashtra 416416',
  '97/97, Sangli-Miraj Rd, Gandhi Nagar, Vishrambag, Sangli, Maharashtra 416416',
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
        backgroundColor: const Color(0xffEFEFEF),
        body: Column(
          children: [
            SizedBox(height: mQHeight / 15),
            Center(
              child: Text(
                'Top Deals on ${widget.Category}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: brandName.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: const Color.fromARGB(255, 252, 255, 252),
                    elevation: 2,
                    child: InkWell(
                      onTap: () {
                        Get.snackbar('Tapped on ', '${brandName[index]} card');
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: mQHeight / 6.7,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(238, 255, 255, 255),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              // First Row Main
                              child: Row(
                                children: [
                                  //first child image
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.asset(
                                        '${imageURL[index]}',
                                        width: mQWidth / 2.7,
                                        height: mQHeight / 8.5,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  //second child column
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //title
                                        SizedBox(
                                          width: mQWidth / 1.9,
                                          child: AutoSizeText(
                                            brandName[index],
                                            style: const TextStyle(
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
                                            const SizedBox(width: 2),
                                            RatingBarIndicator(
                                              rating: ratings[index],
                                              itemBuilder: (context, index) =>
                                                  const Icon(
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
                                          width: mQWidth / 1.9,
                                          child: Text(
                                            '${address[index]}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                            softWrap: true,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
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
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${noOfVisits[index]} people visited',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.snackbar(
                                          'Item Name', 'Added to Favorites');
                                    },
                                    child: const Row(
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
