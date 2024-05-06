// ignore_for_file: empty_catches, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:offerswala/api/const.dart';
import 'package:offerswala/methods/popScope_onback.dart';
import 'package:offerswala/models/city.dart';
import 'package:offerswala/screens/Home/homepage_navigator.dart';
import 'package:offerswala/screens/login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:searchfield/searchfield.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key, required this.uid});
  final String uid;

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  late List<City> cities = [];

  String? setCityString = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await dio.get(getCitiesURL);
      setState(() {
        cities = (response.data['cities'] as List)
            .map((cityData) => City(
                  cityName: cityData['City'],
                  cityID: cityData['CTID'],
                ))
            .toList();
      });
    } catch (error) {}
  }

  String? selectCity;
  String cityID = "";
  bool isLoading = false;

  bool isSelect = false;
  var searchController = TextEditingController();
  var suggestion = [];

  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    return PopScope(
      canPop: false,
      onPopInvoked: (didpop) async {
        if (didpop) {
          return;
        }
        final bool shouldPop = await onback(context);
        if (shouldPop) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              color: const Color(0xffEFEFEF),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Center(
                      child: Text('Select Location',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))),
                  const SizedBox(height: 20),
                  // Search Bar Widget
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: mQWidth / 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: SearchField<City>(
                        controller: searchController,
                        hint: 'Type city name',
                        itemHeight: 50,
                        searchInputDecoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          hintStyle: TextStyle(),
                        ),
                        suggestionsDecoration: SuggestionDecoration(
                            padding: const EdgeInsets.all(4),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        suggestions: cities
                            .map((city) => SearchFieldListItem<City>(
                                  city.cityName,
                                  item: city,
                                  child: TextButton(
                                    child: Text(
                                      city.cityName,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () async {
                                      cityID = city.cityID;
                                      try {
                                        var res = await dio
                                            .post(updateCityURL, data: {
                                          "CTID": cityID,
                                          "UID": widget.uid,
                                        });
                                        Navigator.pushReplacement(
                                          context,
                                          PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child: Home(
                                              cityName: selectCity ?? '',
                                              cityID: cityID.toString(),
                                              uid: widget.uid,
                                            ),
                                          ),
                                        );
                                      } catch (e) {}
                                    },
                                  ),
                                ))
                            .toList(),
                      )),

                  const SizedBox(height: 18),
                  const Text('OR',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 18),
                  //location button
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: mQWidth / 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: const Color(0xffBA172F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)),
                      ),
                      onPressed: selectLocation,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.my_location_rounded, color: Colors.white),
                          SizedBox(width: 7),
                          Text(
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
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // popular cities container
            Container(
              padding: EdgeInsets.symmetric(horizontal: mQWidth / 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Popular Cities', style: TextStyle(fontSize: 15)),
                  const SizedBox(height: 10),
                  //List of cities
                  SizedBox(
                    height: mQHeight / 2,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: cities.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            cities[index].cityName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onTap: () async {
                            setState(() {
                              selectCity = cities[index].cityName;
                              cityID = cities[index].cityID;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            //confirm button
            Container(
              margin: EdgeInsets.symmetric(horizontal: mQWidth / 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color(0xffBA172F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                onPressed: () async {
                  if (selectCity == null) {
                    Get.snackbar('City not selected', 'Please select a city');
                  } else {
                    try {
                      var res = await dio.post(updateCityURL, data: {
                        "CTID": cityID,
                        "UID": widget.uid,
                      });
                    } catch (e) {}
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: Home(
                          cityName: selectCity ?? '',
                          uid: widget.uid,
                          cityID: cityID.toString(),
                        ),
                      ),
                    );
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
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
      String? setSelectCity = placemark[0].locality;

      setState(() {
        selectCity = setSelectCity;
        isLoading = false;
      });

      // Find the city ID for the selected city
      for (var city in cities) {
        if (city.cityName.contains(selectCity.toString())) {
          cityID = city.cityID;
          break;
        }
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
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
      setState(() {
        isLoading = false;
      });

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        Get.snackbar('Location Access Denied',
            'Please Allow Location Access to continue');
        setState(() {
          isLoading = false;
        });
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Permissions Denied Permanently',
          'Location Authentication is denied permanently.');
      setState(() {
        isLoading = false;
      });
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
