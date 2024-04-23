import 'package:flutter/material.dart';

class bottomImageGrid extends StatelessWidget {
  const bottomImageGrid({
    super.key,
    required this.mQWidth,
  });

  final double mQWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/grid/activity.png',
                    width: mQWidth / 2.4,
                  ),
                  Image.asset(
                    'assets/images/grid/Buffet.png',
                    width: mQWidth / 2.4,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/grid/salon.png',
                    width: mQWidth / 2.4,
                  ),
                  Image.asset(
                    'assets/images/grid/spa.png',
                    width: mQWidth / 2.4,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
