import 'package:flutter/material.dart';

final ThemeData myappTheme = ThemeData(
    fontFamily: 'Gilroy',
    useMaterial3: true,
    primaryColor: Color(0xFFBA172F),

    //bottom nav bar theme

    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: MaterialStateProperty.resolveWith((state) {
        return const TextStyle(color: Colors.white, fontSize: 12);
      }),
    ),
    cardColor: Colors.white);
