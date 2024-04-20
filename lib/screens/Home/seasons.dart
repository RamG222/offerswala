import 'package:flutter/material.dart';

class SeasonsBar extends StatelessWidget {
  const SeasonsBar({
    super.key,
    required this.mQWidth,
  });

  final double mQWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 45,
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    transform: GradientRotation(1.5708),
                    tileMode: TileMode.clamp,
                    colors: [
                      Colors.white,
                      Colors.white,
                      Colors.blueAccent,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/Umbrella.png',
                          width: mQWidth / 3.5,
                        ),
                        Image.asset(
                          'assets/images/Raincoat.png',
                          width: mQWidth / 3.5,
                        ),
                        Image.asset(
                          'assets/images/Coffee.png',
                          width: mQWidth / 3.5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(100, -50),
              child: Image.asset(
                'assets/images/Monsoon-Title.png',
                width: mQWidth / 2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
