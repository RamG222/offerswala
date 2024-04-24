// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';

// class OffersListScreen extends StatefulWidget {
//   OffersListScreen(
//       {super.key,
//       required this.imageURL,
//       required this.title,
//       required this.ratings,
//       required this.address,
//       required this.offerID,
//       required this.noOfVisits,
//       required this.isVeg});

//   String imageURL;
//   String title;
//   double ratings;
//   String address;
//   int offerID;
//   var noOfVisits;
//   bool isVeg;

//   @override
//   State<OffersListScreen> createState() => _OffersListScreenState();
// }

// class _OffersListScreenState extends State<OffersListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var mQSize = MediaQuery.of(context).size;
//     var mQHeight = mQSize.height;
//     var mQWidth = mQSize.width;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           color: Color(0xffEFEFEF),
//           child: Column(
//             children: [
//               SizedBox(height: mQHeight / 17),
//               Center(
//                   child: Text(
//                 'Top Offers',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: mQHeight / 30,
//                 ),
//               )),
//               OffersListCard(
//                 imageURL: widget.imageURL,
//                 address: widget.address,
//                 title:
//                     '50% off for Lunch at Natraj Annex on Tuesdays and Thursdays',
//                 ratings: widget.ratings,
//                 offerID: widget.offerID,
//                 noOfVisits: widget.noOfVisits,
//                 isVeg: widget.isVeg,
//               ),
//               // OffersListCard(
//               //   imageURL: 'assets/images/offerlist_card/New Hanuman.jpg',
//               //   address:
//               //       'Gandhi Nagar, Vishrambag Sangli, Sangli Miraj Kupwad, Maharashtra 416415',
//               //   title: 'New Hanuman Executive',
//               //   ratings: widget.ratings,
//               //   offerID: widget.offerID,
//               //   noOfVisits: widget.noOfVisits,
//               //   isVeg: widget.isVeg,
//               // ),
//               // OffersListCard(
//               //   imageURL: 'assets/images/offerlist_card/Ajwaa.jpg',
//               //   address: widget.address,
//               //   title: 'Ajwaa Restaurant',
//               //   ratings: widget.ratings,
//               //   offerID: widget.offerID,
//               //   noOfVisits: widget.noOfVisits,
//               //   isVeg: false,
//               // ),
//               // OffersListCard(
//               //   imageURL: 'assets/images/offerlist_card/Sarovar.jpg',
//               //   address: widget.address,
//               //   title: 'Hotel Sarovar',
//               //   ratings: widget.ratings,
//               //   offerID: widget.offerID,
//               //   noOfVisits: widget.noOfVisits,
//               //   isVeg: widget.isVeg,
//               // ),
//               // OffersListCard(
//               //   imageURL: 'assets/images/offerlist_card/Rahamatullah.jpg',
//               //   address: widget.address,
//               //   title: 'Rahamatullah Restaurant',
//               //   ratings: widget.ratings,
//               //   offerID: widget.offerID,
//               //   noOfVisits: widget.noOfVisits,
//               //   isVeg: false,
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class OffersListCard extends StatelessWidget {
//   OffersListCard(
//       {super.key,
//       required this.imageURL,
//       required this.title,
//       required this.ratings,
//       required this.address,
//       required this.offerID,
//       required this.noOfVisits,
//       required this.isVeg});
//   String imageURL;
//   String title;
//   double ratings;
//   String address;
//   int offerID;
//   var noOfVisits;
//   bool isVeg;
//   @override
//   Widget build(BuildContext context) {
//     var mQSize = MediaQuery.of(context).size;
//     var mQHeight = mQSize.height;
//     var mQWidth = mQSize.width;
//     return Card(
//       color: Colors.white,
//       elevation: 5,
//       child: SizedBox(
//         width: mQWidth / 1.05,
//         height: mQHeight / 3,
//         child: Column(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.asset(
//                 imageURL,
//                 width: double.infinity,
//                 height: 180,
//                 fit: BoxFit.fill,
//               ),
//             ),
//             SizedBox(
//               width: double.infinity,
//               height: 80,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   title,
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                       overflow: TextOverflow.ellipsis,
//                       fontFamily: 'Montserrat'),
//                   maxLines: 2,
//                   textAlign: TextAlign.start,
//                 ),
//               ),
//             ),
//             Text('data')
//           ],
//         ),
//       ),
//     );
//   }
// }
