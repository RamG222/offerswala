import 'package:flutter/material.dart';
import 'package:offerswala/screens/Home/categories_scrolling_widget.dart';
import 'package:offerswala/screens/Home/image_slider.dart';
import 'package:searchfield/searchfield.dart';

class Screen0 extends StatefulWidget {
  const Screen0({super.key});

  @override
  State<Screen0> createState() => _Screen0State();
}

var suggestion = ['a', 'b', 'c', 'd'];

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
                    IconButton(
                      onPressed: () {},
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: mQWidth / 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: SearchField(
                    onSearchTextChanged: (query) {
                      final filter = suggestion
                          .where((element) => element
                              .toString()
                              .toLowerCase()
                              .contains(query.toLowerCase()))
                          .toList();
                      return filter
                          .map((e) => SearchFieldListItem<String>(e,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Text(e),
                              )))
                          .toList();
                    },
                    hint: 'Search',
                    itemHeight: 50,
                    searchInputDecoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(),
                    ),
                    suggestionsDecoration: SuggestionDecoration(
                        padding: const EdgeInsets.all(4),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    suggestions: [],
                  ),
                ),

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
          //
          // Categories Scrolling Widget
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Catergories_Scrolling_widget(
                mQWidth: mQWidth, mQHeight: mQHeight),
          ),

          // Featured Image at Bottom
          Container(
            margin: EdgeInsets.fromLTRB(10, 6, 10, 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/image_slider/3.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
