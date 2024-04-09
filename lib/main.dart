import 'package:flutter/material.dart';
import 'package:offerswala/screens/first_location_access.dart';
import 'package:offerswala/screens/signup.dart';
import 'package:offerswala/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Loading Splash Screen Faster
    precacheImage(const AssetImage("assets/images/logo.png"), context);

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Gilroy',
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
