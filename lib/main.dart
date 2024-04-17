import 'package:flutter/material.dart';
import 'package:offerswala/screens/Home/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    void loadImages() async {
      //for making slides images load faster by cache
      await precacheImage(AssetImage("assets/images/logo.png"), context);
      await precacheImage(AssetImage("assets/images/01.gif"), context);
      await precacheImage(AssetImage("assets/images/02.gif"), context);
      await precacheImage(AssetImage("assets/images/03.gif"), context);
    }

    loadImages();

    return MaterialApp(
      theme: ThemeData(
        //setting deafult font
        fontFamily: 'Gilroy',
        useMaterial3: true,
        primaryColor: const Color(0xffBA172F),
      ),
      home: Home(),
    );
  }
}
