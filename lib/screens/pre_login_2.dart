import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:offerswala/screens/login.dart';
import 'package:offerswala/screens/pre_login_1.dart';
import 'package:offerswala/screens/pre_login_3.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class PreLogin2 extends StatelessWidget {
  const PreLogin2({super.key});

  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    bool isWideScreen() {
      if (MediaQuery.of(context).size.width > 800) {
        return true;
      } else {
        return false;
      }
    }

    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! < 0) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const PreLogin3()));
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const PreLogin1()));
        }
      },
      child: Scaffold(
        body: isWideScreen()
            ? const Center(
                child: Text('Tablet or Web'),
              )
            : Center(
                child: Column(
                  children: [
                    SizedBox(height: mQHeight / 7),
                    Image.asset(
                      "assets/images/Offers _Discounts.png",
                      width: mQWidth / 1.5,
                    ),
                    SizedBox(
                      height: mQHeight / 30,
                    ),
                    Text(
                      'Offers & Discounts',
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: mQHeight / 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: mQHeight / 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: mQWidth / 9),
                      child: const Text(
                        'Get exclusive discounts and special offers on a wide range of Local products and services',
                        textAlign: TextAlign.center,
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(
                      height: mQHeight / 10,
                    ),
                    PageViewDotIndicator(
                      currentItem: 1,
                      count: 3,
                      alignment: Alignment.center,
                      unselectedColor: Colors.black26,
                      selectedColor: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      height: mQHeight / 5.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffE6E6E6),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mQWidth / 15),
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffFFE059),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PreLogin3()));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mQWidth / 15),
                                  child: Text(
                                    'Next >',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))),
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
