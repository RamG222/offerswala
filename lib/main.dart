import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:offerswala/screens/select_location_Screen.dart';
import 'package:offerswala/screens/splash_screen.dart';
import 'package:offerswala/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    void loadImage() async {
      //for making slides images load faster by cache
      await precacheImage(const AssetImage("assets/images/logo.png"), context);
    }

    loadImage();

    return GetMaterialApp(
      theme: myappTheme,
      home: const SplashScreen(),
    );
  }
}
