import 'package:flutter/material.dart';
import 'package:offerswala/screens/pre_login/1.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //showing splash screen for 3 seconds and then routing to next page
    void delayAndRoute() async {
      // List of futures representing precaching tasks
      List<Future<void>> precacheFutures = [
        Future.delayed(const Duration(milliseconds: 3000)),
        precacheImage(const AssetImage("assets/images/01.gif"), context),
        precacheImage(const AssetImage("assets/images/02.gif"), context),
        precacheImage(const AssetImage("assets/images/03.gif"), context),
      ];

      // Waiting for all precaching tasks to complete using Future.wait
      await Future.wait(precacheFutures);

      // Navigating to the next screen after all images are precached
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => const PreLogin1(),
        ),
      );
    }

    delayAndRoute();

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
