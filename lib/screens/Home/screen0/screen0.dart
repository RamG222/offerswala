import 'package:flutter/material.dart';
import 'package:offerswala/screens/Home/screen0/b1g1.dart';
import 'package:offerswala/screens/Home/screen0/bottom_image_grid.dart';
import 'package:offerswala/screens/Home/screen0/brands_scrolling_widget.dart';
import 'package:offerswala/screens/Home/screen0/categories_scrolling_widget.dart';
import 'package:offerswala/screens/Home/screen0/image_slider.dart';
import 'package:offerswala/screens/Home/screen0/search_box.dart';
import 'package:offerswala/screens/Home/screen0/seasons.dart';
import 'package:offerswala/screens/Home/screen0/ticker.dart';
import 'package:offerswala/screens/Select_location_Screen.dart';

class Screen0 extends StatefulWidget {
  const Screen0({super.key});

  @override
  State<Screen0> createState() => _Screen0State();
}

class _Screen0State extends State<Screen0> {
  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          //setting backgroud Image (top)
          Container(
            height: mQHeight / 2,
            width: mQWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.6,
                image: AssetImage(
                  'assets/images/111.jpg',
                ),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: mQHeight / 20,
                ),
                // Row for displaying Logo, Location Text and Location Icon,
                Row(
                  children: [
                    SizedBox(
                      width: mQWidth / 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/logo.png',
                          width: mQWidth / 15),
                    ),
                    SizedBox(
                      width: mQWidth / 25,
                    ),
                    SizedBox(
                      width: mQWidth / 1.5,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectLocationScreen(),
                              ));
                        },
                        child: Text(
                          'Pune ',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: mQHeight / 55,
                              color: Color.fromARGB(255, 255, 255, 255),
                              overflow: TextOverflow.ellipsis),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectLocationScreen(),
                            ));
                      },
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mQHeight / 150,
                ),

                // Search Bar Widget
                SearchBox(mQWidth: mQWidth, mQHeight: mQHeight),

                // Hero Image
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    'assets/images/hero.png',
                    height: mQHeight / 12,
                  ),
                ),

                // Image Slider
                Container(
                  height: mQHeight / 5.2,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ImageSlider(mQWidth: mQWidth, mQHeight: mQHeight),
                ),
              ],
            ),
          ),
          //End of Top container (The one with Backgroud image)

          //start of Bottom Container
          Container(
            color: Color(0xffEFEFEF),
            child: Column(
              children: [
                Categories_view(mQWidth: mQWidth, mQHeight: mQHeight),
                Brands_View(mQWidth: mQWidth, mQHeight: mQHeight),
                Container(
                  margin: EdgeInsets.only(left: 14, right: 14),
                  child: Image.asset('assets/images/Ad1.png'),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 20, bottom: 10, left: 14, right: 14),
                  child: Image.asset('assets/images/Ad3.png'),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 0, bottom: 10, left: 10, right: 10),
                  child: bottomImageGrid(mQWidth: mQWidth),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 0, bottom: 10, left: 10, right: 10),
                  child: B1G1card(mQWidth: mQWidth),
                ),
                SeasonsBar(mQWidth: mQWidth),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white,
                  child: Ticker(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}