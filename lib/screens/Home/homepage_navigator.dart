import 'package:flutter/material.dart';
import 'package:offerswala/screens/Home/screen0.dart';
import 'package:offerswala/screens/Home/screen1.dart';
import 'package:offerswala/screens/Home/screen2.dart';
import 'package:offerswala/screens/Home/screen3.dart';
import 'package:offerswala/screens/Home/screen4.dart';
import 'package:offerswala/widescreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

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

    var bottomAppBar = [];

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        backgroundColor: const Color(0xffBA172F),
        selectedIndex: currentIndex,
        indicatorColor: Color.fromARGB(30, 255, 82, 82),
        destinations: [
          NavigationDestination(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(
                Icons.category,
                color: Colors.white,
              ),
              label: 'Categories'),
          NavigationDestination(
              icon: Icon(
                Icons.trending_up,
                color: Colors.white,
              ),
              label: 'Trending'),
          NavigationDestination(
              //show badge only when something is selected //here temporary some bool used.
              icon: isWideScreen(context)
                  ? Icon(
                      Icons.favorite,
                      color: Colors.white,
                    )
                  : Badge(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      label: Text(
                        ' 1 ',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
              label: 'Favorites'),
          NavigationDestination(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'Account',
          ),
        ],
      ),
      body: <Widget>[
        Screen0(),
        Screen1(),
        Screen2(),
        Screen3(),
        Screen4(),
      ][currentIndex],
    );
  }
}
