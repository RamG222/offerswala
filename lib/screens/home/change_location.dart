import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class ChangeLocationScreen extends StatefulWidget {
  const ChangeLocationScreen({super.key});

  @override
  State<ChangeLocationScreen> createState() => _ChangeLocationScreenState();
}

class _ChangeLocationScreenState extends State<ChangeLocationScreen> {
  String? selectCity;

  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: mQHeight / 14),
            Text(
              "Change Location",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: mQHeight / 50,
            ),
            ElevatedButton(
              onPressed: selectLocation,
              child: Text(
                'Get Location',
              ),
            ),
            SizedBox(
              height: mQHeight / 50,
            ),
            Text(
              selectCity ?? "",
              style: TextStyle(fontSize: 20),
            ), //and add this,
            SizedBox(
              height: mQHeight / 50,
            ),
            Text(
              "OR",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: mQWidth / 20, vertical: mQHeight / 75),
              child: const SearchBar(
                hintText: 'Search Location',
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Submit')),
          ],
        ),
      ),
    );
  }

  void selectLocation() async {
    var location = await _determinePosition();
    var lat = location.latitude;
    var long = location.longitude;
    try {
      List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
      String? setSelectCity = await placemark[0].locality;

      setState(() {
        selectCity = setSelectCity;
      });
    } catch (e) {}
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
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
