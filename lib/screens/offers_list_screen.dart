import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class OffersListScreen extends StatefulWidget {
  OffersListScreen(
      {super.key,
      required this.imageURL,
      required this.title,
      required this.ratings,
      required this.address,
      required this.offerID,
      required this.noOfVisits,
      required this.isVeg});

  String imageURL;
  String title;
  double ratings;
  String address;
  int offerID;
  var noOfVisits;
  bool isVeg;

  @override
  State<OffersListScreen> createState() => _OffersListScreenState();
}

class _OffersListScreenState extends State<OffersListScreen> {
  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffEFEFEF),
          child: Column(
            children: [
              SizedBox(height: mQHeight / 17),
              Center(
                  child: Text(
                'Top Offers',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: mQHeight / 30,
                ),
              )),
              OffersListCard(
                imageURL: widget.imageURL,
                address: widget.address,
                title: widget.title,
                ratings: widget.ratings,
                offerID: widget.offerID,
                noOfVisits: widget.noOfVisits,
                isVeg: widget.isVeg,
              ),
              OffersListCard(
                imageURL: 'assets/images/offerlist_card/New Hanuman.jpg',
                address:
                    'Gandhi Nagar, Vishrambag Sangli, Sangli Miraj Kupwad, Maharashtra 416415',
                title: 'New Hanuman Executive',
                ratings: widget.ratings,
                offerID: widget.offerID,
                noOfVisits: widget.noOfVisits,
                isVeg: widget.isVeg,
              ),
              OffersListCard(
                imageURL: 'assets/images/offerlist_card/Ajwaa.jpg',
                address: widget.address,
                title: 'Ajwaa Restaurant',
                ratings: widget.ratings,
                offerID: widget.offerID,
                noOfVisits: widget.noOfVisits,
                isVeg: false,
              ),
              OffersListCard(
                imageURL: 'assets/images/offerlist_card/Sarovar.jpg',
                address: widget.address,
                title: 'Hotel Sarovar',
                ratings: widget.ratings,
                offerID: widget.offerID,
                noOfVisits: widget.noOfVisits,
                isVeg: widget.isVeg,
              ),
              OffersListCard(
                imageURL: 'assets/images/offerlist_card/Rahamatullah.jpg',
                address: widget.address,
                title: 'Rahamatullah Restaurant',
                ratings: widget.ratings,
                offerID: widget.offerID,
                noOfVisits: widget.noOfVisits,
                isVeg: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OffersListCard extends StatelessWidget {
  OffersListCard(
      {super.key,
      required this.imageURL,
      required this.title,
      required this.ratings,
      required this.address,
      required this.offerID,
      required this.noOfVisits,
      required this.isVeg});
  String imageURL;
  String title;
  double ratings;
  String address;
  int offerID;
  var noOfVisits;
  bool isVeg;
  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    imageURL,
                    width: mQWidth / 2.75,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          ratings.toString(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 2),
                        RatingBarIndicator(
                          unratedColor: Colors.white,
                          rating: ratings,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 10.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: mQWidth / 1.9,
                      child: Text(
                        address,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        isVeg
                            ? Image.asset(
                                'assets/images/icons/veg.png',
                                width: mQWidth / 25,
                              )
                            : Image.asset(
                                'assets/images/icons/non-veg.png',
                                width: mQWidth / 25,
                              ),
                        SizedBox(
                          width: mQWidth / 4,
                        ),
                        Container(
                          height: 25,
                          color: const Color(0xffBA172F),
                          child: InkWell(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: mQWidth / 27),
                                child: Text(
                                  'GET OFFER',
                                  style: TextStyle(
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Color.fromARGB(255, 218, 218, 218),
            padding: EdgeInsets.symmetric(horizontal: mQWidth / 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${noOfVisits.toString()} people visited ',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      'Add to Favorites  ',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 20,
                      ),
                      onTap: () {
                        Get.snackbar('Fav', 'message');
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
