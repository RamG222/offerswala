import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:offerswala/screens/home/categories_card.dart';
import 'package:offerswala/screens/home/change_location.dart';
import 'package:offerswala/widescreen.dart';
import 'package:offerswala/screens/home/image_slider.dart';
import 'package:offerswala/screens/home/top_brands_card.dart';
import 'package:offerswala/screens/home/top_search_bar.dart';

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
        child: !isWideScreen(context)
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
                  iconTheme: const IconThemeData(color: Colors.black),
                  title: Transform.translate(
                    offset: Offset(-20.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: mQWidth / 10,
                        ),
                        SizedBox(
                          width: mQWidth / 20,
                        ),
                        Container(
                          width: mQWidth / 2.4,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Row(
                            children: [
                              Center(
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  height: 25,
                                  width: mQWidth / 5,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 18,
                                      ),
                                      Text(
                                        "Location",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: mQWidth / 5,
                                padding: EdgeInsets.all(3),
                                child: Center(
                                  child: Text(
                                    'Mumbai',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: mQWidth / 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Admin',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              width: mQWidth / 60,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(mQHeight / 2),
                                  border: Border.all()),
                              child: Icon(
                                Icons.account_circle,
                                color: const Color(0xffBA172F),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const top_search_bar(),
                      const Image_slider(),
                      // const Categories_Card(),
                      // SizedBox(height: mQHeight / 100),
                      // const Top_Brands_card()
                    ],
                  ),
                ),
              )
            : const Scaffold(),
      ),
    );
  }
}
