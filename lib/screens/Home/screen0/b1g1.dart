import 'package:flutter/material.dart';

class B1G1card extends StatelessWidget {
  const B1G1card({
    super.key,
    required this.mQWidth,
  });

  final double mQWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/B-99 offer.png',
              width: mQWidth / 5.5,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/Buy1-Get1.png',
              width: mQWidth / 5.5,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/Buy2-Get1.png',
              width: mQWidth / 5.5,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/Buy1-Get2.png',
              width: mQWidth / 5.5,
            ),
          ),
        ],
      ),
    );
  }
}
