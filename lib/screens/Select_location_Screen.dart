import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:offerswala/screens/Home/homepage_navigator.dart';
import 'package:searchfield/searchfield.dart';

List<String> cities = [
  'Pune',
  'Mumbai',
  'Bengaluru',
  'Hyderabad',
  'New Delhi',
  'Chennai',
  'Kolkata',
  'Ahmedabad',
  'Lucknow',
  'Patna',
  'Jaipur',
  'Noida',
  "Navi Mumbai"
];

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({Key? key}) : super(key: key);

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  String? selectCity;
  bool isLoading = false;

  bool isSelect = false;
  var searchController = TextEditingController();

  var suggestion = [...cities];

  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Color(0xffEFEFEF),
            // color: Color.fromARGB(30, 255, 82, 82), // reddish faint color
            child: Column(
              children: [
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Select Location',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Search Bar Widget
                Container(
                  margin: EdgeInsets.symmetric(horizontal: mQWidth / 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: SearchField(
                    controller: searchController,
                    onSearchTextChanged: (query) {
                      final filter = suggestion
                          .where((element) => element
                              .toString()
                              .toLowerCase()
                              .startsWith(query.toLowerCase()))
                          .toList();

                      return filter
                          .map((e) => SearchFieldListItem<String>(e,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: TextButton(
                                  child: Text(e),
                                  onPressed: () {
                                    setState(() {
                                      selectCity = e;
                                    });
                                    searchController.clear();
                                  },
                                ),
                              )))
                          .toList();
                    },
                    hint: 'Type city name',
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
                      ),
                    ),
                    suggestions: [],
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  'OR',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 18),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: mQWidth / 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                      backgroundColor: const Color(0xffBA172F),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9)),
                    ),
                    onPressed: selectLocation,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.my_location_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        const Text(
                          'Use my current location',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: mQHeight / 40),
                isLoading
                    ? CircularProgressIndicator(
                        color: ThemeData().primaryColor,
                      )
                    : Text(
                        selectCity ?? "Choose City to proceed",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: mQWidth / 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Popular Cities',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: mQHeight / 2,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          cities[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          setState(() {
                            selectCity = cities[index];
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: mQWidth / 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
                backgroundColor: const Color(0xffBA172F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              onPressed: () {
                if (selectCity == null) {
                  Get.snackbar('City not selected', 'Please select a city');
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void selectLocation() async {
    setState(() {
      isLoading = true;
      selectCity = '';
    });

    var location = await _determinePosition();
    var lat = location.latitude;
    var long = location.longitude;
    try {
      List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
      String? setSelectCity = await placemark[0].locality;

      setState(() {
        selectCity = setSelectCity;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    Get.snackbar(
        'Location Services are disabled', 'Please enable Location services.');

    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      Get.snackbar(
          'Location Access Denied', 'Please Allow Location Access to continue');
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    Get.snackbar('Permissions Denied Permanently',
        'Location Authentication is denied permanently.');
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
