import 'package:flutter/material.dart';
import 'package:offerswala/api/const.dart';
import 'package:offerswala/models/sub_ads.dart';
import 'package:offerswala/screens/CategoryWiseBrandScreen.dart';
import 'package:offerswala/screens/Home/screen0/b1g1.dart';
import 'package:offerswala/screens/Home/screen0/bottom_image_grid.dart';
import 'package:offerswala/screens/Home/screen0/brands_scrolling_widget.dart';
import 'package:offerswala/screens/Home/screen0/category_scrolling_widget.dart';
import 'package:offerswala/screens/Home/screen0/image_slider.dart';
import 'package:offerswala/screens/Home/screen0/search_box.dart';
import 'package:offerswala/screens/Home/screen0/seasons.dart';
import 'package:offerswala/screens/Home/screen0/ticker.dart';
import 'package:offerswala/screens/select_location_Screen.dart';
import 'package:offerswala/screens/login.dart';

List<SubAdsModel> subAds = [];

class Screen0 extends StatefulWidget {
  const Screen0({
    super.key,
    required this.uid,
    required this.cityID,
    required this.cityName,
  });
  final String uid;
  final String cityID;
  final String cityName;

  @override
  State<Screen0> createState() => _Screen0State();
}

class _Screen0State extends State<Screen0> {
  late Future<List<SubAdsModel>> _futureSubAds;
  @override
  void initState() {
    _futureSubAds = getSubAdsData();

    super.initState();
  }

  Future<List<SubAdsModel>> getSubAdsData() async {
    var responseSubData = await dio.get(getSubAds);

    setState(() {
      for (var subAd in responseSubData.data['sub_ads']) {
        subAds.add(SubAdsModel(
          imageURL: subAd['Sub_ads_img'],
        ));
      }
    });
    return subAds;
  }

  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          //setting backgroud Image (top)
          Container(
            height: mQHeight / 2,
            width: mQWidth,
            decoration: const BoxDecoration(
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
                SizedBox(height: mQHeight / 20),
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                maintainState: false,
                                builder: (context) => SelectLocationScreen(
                                  uid: widget.uid,
                                ),
                              ));
                        },
                        child: Text(
                          widget.cityName,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: mQHeight / 55,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              overflow: TextOverflow.ellipsis),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectLocationScreen(
                                uid: widget.uid,
                              ),
                            ));
                      },
                      icon: const Icon(
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
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    'assets/images/hero.png',
                    height: mQHeight / 12,
                  ),
                ),

                // Image Slider
                Container(
                  height: mQHeight / 5.2,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ImageSlider(
                    mQWidth: mQWidth,
                    mQHeight: mQHeight,
                    cityID: widget.cityID,
                  ),
                ),
              ],
            ),
          ),
          //End of Top container (The one with Backgroud image)

          //start of Bottom Container
          Container(
            color: const Color(0xffEFEFEF),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: const CategoryScrollingWidget()),
                BrandsScrollingWidget(cityId: widget.cityID),

                //sub ads column
                FutureBuilder(
                  future: _futureSubAds,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    } else {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 14, right: 14),
                            child: Image.network(imgURL + subAds[0].imageURL),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 20, bottom: 10, left: 14, right: 14),
                            child: Image.network(imgURL + subAds[1].imageURL),
                          ),
                        ],
                      );
                    }
                  },
                ),

                Container(
                  margin: const EdgeInsets.only(
                      top: 0, bottom: 10, left: 10, right: 10),
                  child: bottomImageGrid(mQWidth: mQWidth),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 0, bottom: 10, left: 10, right: 10),
                  child: B1G1card(mQWidth: mQWidth),
                ),
                SeasonsBar(mQWidth: mQWidth),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white,
                  child: const Ticker(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
