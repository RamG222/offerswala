import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocode/geocode.dart';

class FirstLocationAccess extends StatefulWidget {
  const FirstLocationAccess({super.key});

  @override
  State<FirstLocationAccess> createState() => _FirstLocationAccessState();
}

class _FirstLocationAccessState extends State<FirstLocationAccess> {
  String? selectCity; //here

  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: mQHeight / 6),
            Center(
              child: Icon(Icons.location_on_outlined, size: mQHeight / 10),
            ),
            SizedBox(height: mQHeight / 25),
            ElevatedButton(
              onPressed: () async {
                var location = await _determinePosition();
                var lat = location.latitude;
                var long = location.longitude;
                try {
                  List<Placemark> placemark =
                      await placemarkFromCoordinates(lat, long);
                  String? setSelectCity = await placemark[0].locality;

                  setState(() {
                    selectCity = setSelectCity;
                  });
                  print(selectCity);
                } catch (e) {
                  print(e);
                }
              },
              child: const Text("Select Location"),
            ),
            SizedBox(height: mQHeight / 25),
            Text(selectCity ?? ""), //and add this,
            SizedBox(height: mQHeight / 25),
            ElevatedButton(onPressed: () {}, child: const Text('Continue')),
          ],
        ),
      ),
    );
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
