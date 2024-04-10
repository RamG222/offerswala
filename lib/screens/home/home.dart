import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:offerswala/screens/home/categories_card.dart';
import 'package:offerswala/screens/home/change_location.dart';
import 'package:offerswala/screens/home/image_slider.dart';
import 'package:offerswala/screens/home/top_brands_card.dart';

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
    bool isWideScreen() {
      if (mQWidth < 800) {
        return true;
      } else {
        return false;
      }
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (bool value) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("Exit Application?"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'NO'),
                child: const Text('NO'),
              ),
              SizedBox(width: 10),
              TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red.shade100)),
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text("Exit"),
              ),
            ],
          ),
        );
      },
      child: SafeArea(
        child: isWideScreen()
            ? Scaffold(
                drawer: Drawer(
                  backgroundColor: Color.fromARGB(255, 191, 140, 149),
                  child: Column(
                    children: [
                      SizedBox(height: mQHeight / 20),
                      Image.asset(
                        "assets/images/logo.png",
                        width: mQWidth / 2,
                      ),
                      SizedBox(height: mQHeight / 18),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('My Profile')),
                      SizedBox(height: mQHeight / 130),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Offers')),
                      SizedBox(height: mQHeight / 5),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Log out')),
                    ],
                  ),
                ),
                appBar: AppBar(
                  iconTheme: const IconThemeData(color: Color(0xffBA172F)),
                  title: Transform.translate(
                    offset: Offset(-24.0, 0.0),
                    child: Row(
                      children: [
                        Image.asset('assets/images/logo.png',
                            width: mQWidth / 10),
                        SizedBox(
                          width: mQWidth / 120,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ChangeLocationScreen(),
                              ),
                            );
                          },
                          child: const Text('Mumbai'),
                        ),
                        Expanded(
                          child: SearchBar(
                            hintText: 'Search Offers',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Image_slider(),
                      const Categories_Card(),
                      SizedBox(height: mQHeight / 100),
                      const Top_Brands_card()
                    ],
                  ),
                ),
              )
            : const Scaffold(),
      ),
    );
  }
}
