import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ticker extends StatelessWidget {
  const Ticker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int indexforTap = -1;

    return CarouselSlider(
      options: CarouselOptions(height: 150.0),
      items: [
        'assets/images/ticker/Ticket-Red.png',
        'assets/images/ticker/Ticket-Green.png',
        'assets/images/ticker/Ticket-Yellow.png',
        'assets/images/ticker/Ticket-Blue.png'
      ].map((index) {
        print(index);
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: InkWell(
                child: Image.asset(index),
                onTap: () {
                  indexforTap++;

                  Get.snackbar("$indexforTap", '');
                },
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
