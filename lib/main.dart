import 'package:flutter/material.dart';
import 'package:offerswala/screens/Home/homepage.dart';
import 'package:offerswala/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    void loadImage() async {
      //for making slides images load faster by cache
      await precacheImage(AssetImage("assets/images/logo.png"), context);
    }

    loadImage();

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
