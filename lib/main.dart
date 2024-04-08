import 'package:flutter/material.dart';
import 'package:offerswala/screens/first_location_access.dart';
import 'package:offerswala/screens/form.dart';
import 'package:offerswala/screens/home/home.dart';
import 'package:offerswala/screens/login.dart';
import 'package:offerswala/screens/pre_login_1.dart';
import 'package:offerswala/screens/pre_login_2.dart';
import 'package:offerswala/screens/pre_login_3.dart';
import 'package:offerswala/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Gilroy',
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
