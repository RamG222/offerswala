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

    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.selected)
                    ? TextStyle(
                        color: Color(0xFFBA172F),
                      )
                    : TextStyle(color: Colors.black),
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
          indicatorColor: Color.fromARGB(30, 255, 82, 82),
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
                color: currentIndex == 0 ? Color(0xFFBA172F) : null,
              ),
              label: 'Home',
            ),
            NavigationDestination(
                icon: Icon(
                  Icons.grid_view_outlined,
                  color: currentIndex == 1 ? Color(0xFFBA172F) : null,
                ),
                label: 'Categories'),
            NavigationDestination(
                icon: Icon(
                  Icons.whatshot_outlined,
                  color: currentIndex == 2 ? Color(0xFFBA172F) : null,
                ),
                tooltip: 'Sizzling Hot Offers',
                label: 'Trending'),
            NavigationDestination(
                //show badge only when something is selected //here temporary some bool used.
                icon: isWideScreen(context)
                    ? Icon(
                        Icons.favorite,
                        color: currentIndex == 3 ? Color(0xFFBA172F) : null,
                      )
                    : Badge(
                        backgroundColor: Color.fromARGB(255, 238, 255, 55),
                        child: Icon(
                          Icons.favorite,
                          color: currentIndex == 3 ? Color(0xFFBA172F) : null,
                        ),
                        label: Text(
                          ' 1 ',
                          style: TextStyle(
                              color: Color(0xFFBA172F),
                              fontWeight: FontWeight.bold),
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
        Screen0(),
        Screen1(),
        Screen2(),
        Screen3(),
        Screen4(),
      ][currentIndex],
    );
  }
}
