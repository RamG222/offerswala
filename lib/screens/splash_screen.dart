import 'package:flutter/material.dart';
import 'package:offerswala/screens/pre_login_1.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //showing splash screen for 3 seconds and then routing to next page
    void delayAndRoute() async {
      await Future.delayed(const Duration(milliseconds: 3000));
      Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const PreLogin1(),
          ));
    }

    delayAndRoute();

    //for making slides images load faster by cache
    precacheImage(const AssetImage("assets/images/01.gif"), context);
    precacheImage(const AssetImage("assets/images/02.gif"), context);
    precacheImage(const AssetImage("assets/images/03.gif"), context);
    return Scaffold(
      body: Container(
        color: const Color(0xffFFF8EA),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("./assets/images/logo.png", width: 170),
            ],
          ),
        ),
      ),
    );
  }
}
