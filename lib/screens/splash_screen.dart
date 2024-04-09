import 'package:flutter/material.dart';
import 'package:offerswala/screens/pre_login_1.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

    //Loads Slides faster
    precacheImage(
        const AssetImage("assets/images/Vocal_for_Local.png"), context);
    precacheImage(
        const AssetImage("assets/images/Offers _Discounts.png"), context);
    precacheImage(const AssetImage("assets/images/Grab_Save.png"), context);

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
