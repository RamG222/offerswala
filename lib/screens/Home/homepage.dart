import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    var suggestion = ['a', 'b', 'c', 'd'];
    return Scaffold(
      body: Column(
        children: [
          //
          Container(
            height: mQHeight / 5.5,
            width: mQWidth,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 59, 59),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: mQHeight / 20,
                ),
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: mQWidth / 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
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
                    hint: '🔍Search',
                    itemHeight: 50,
                    searchInputDecoration: InputDecoration(
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(left: 20),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}