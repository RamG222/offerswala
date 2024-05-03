// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:offerswala/screens/Home/screen0/screen0.dart';
import 'package:offerswala/screens/Home/screen1/screen1.dart';
import 'package:offerswala/screens/Home/screen2/screen2.dart';
import 'package:offerswala/screens/Home/screen3/screen3.dart';
import 'package:offerswala/screens/Home/screen4/screen4.dart';
import 'package:offerswala/widescreen.dart';
import '../../methods/popScope_onback.dart';

class Home extends StatefulWidget {
  Home({
    super.key,
    required this.uid,
    required this.cityID,
    required this.cityName,
  });
  String cityID;
  String uid;
  String cityName;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

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
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) =>
                  states.contains(MaterialState.selected)
                      ? const TextStyle(
                          color: Color(0xFFBA172F),
                        )
                      : const TextStyle(color: Colors.black),
            ),
          ),
          child: NavigationBar(
            height: 60,
            onDestinationSelected: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            selectedIndex: currentIndex,
            indicatorColor: const Color.fromARGB(30, 255, 82, 82),
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: currentIndex == 0 ? const Color(0xFFBA172F) : null,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                  icon: Icon(
                    Icons.grid_view_outlined,
                    color: currentIndex == 1 ? const Color(0xFFBA172F) : null,
                  ),
                  label: 'Categories'),
              NavigationDestination(
                  icon: Icon(
                    Icons.whatshot_outlined,
                    color: currentIndex == 2 ? const Color(0xFFBA172F) : null,
                  ),
                  tooltip: 'Sizzling Hot Offers',
                  label: 'Trending'),
              NavigationDestination(
                  //show badge only when something is selected //here temporary some bool used.
                  icon: isWideScreen(context)
                      ? Icon(
                          Icons.favorite,
                          color: currentIndex == 3
                              ? const Color(0xFFBA172F)
                              : null,
                        )
                      : Badge(
                          backgroundColor:
                              const Color.fromARGB(255, 238, 255, 55),
                          label: const Text(
                            ' 1 ',
                            style: TextStyle(
                                color: Color(0xFFBA172F),
                                fontWeight: FontWeight.bold),
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: currentIndex == 3
                                ? const Color(0xFFBA172F)
                                : null,
                          ),
                        ),
                  label: 'Favorites'),
              NavigationDestination(
                icon: Icon(
                  Icons.person,
                  color: currentIndex == 4 ? Colors.red : null,
                ),
                label: 'Account',
              ),
            ],
          ),
        ),
        body: <Widget>[
          Screen0(
            uid: widget.uid,
            cityID: widget.cityID,
            cityName: widget.cityName,
          ),
          const Screen1(),
          const Screen2(),
          const Screen3(),
          const Screen4(),
        ][currentIndex],
      ),
    );
  }
}
