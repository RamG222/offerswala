import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:offerswala/screens/splash_screen.dart';
import 'package:offerswala/theme.dart';

import 'screens/Home/homepage_navigator.dart';

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

    return GetMaterialApp(
      theme: myappTheme,
      home: Home(),
    );
  }
}
