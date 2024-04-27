import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:offerswala/screens/CategoryWiseBrandScreen.dart';
import 'package:offerswala/screens/splash_screen.dart';
import 'package:offerswala/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/Home/homepage_navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var uid = prefs.getString("uid");

  // // Login Success
  // SharedPreferences pref = await SharedPreferences.getInstance();
  // pref.setString("uid", userIdController.text);
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
      home: SplashScreen(),
    );
  }
}
