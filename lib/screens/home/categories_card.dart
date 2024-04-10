// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Categories_Card extends StatelessWidget {
  const Categories_Card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    return Card(
      color: Color.fromARGB(255, 255, 246, 166),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      elevation: 5,
      child: Column(
        children: [
          SizedBox(
            height: mQHeight / 100,
          ),
          const Text('Top Categories'),
          SizedBox(
            height: mQHeight / 100,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/icons/categories/fashion.png',
                        width: mQWidth / 10,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Fashion"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/icons/categories/mobile.png',
                        width: mQWidth / 10,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Mobiles"),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/icons/categories/banking.png',
                        width: mQWidth / 10,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Banking"),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/icons/categories/electronics.png',
                        width: mQWidth / 10,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Electronics"),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/icons/categories/cosmetics.png',
                      width: mQWidth / 10,
                    ),
                  ),
                  Text("Cosmetics")
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/icons/categories/hotel.png',
                      width: mQWidth / 10,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Hotels"),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/icons/categories/health.png',
                      width: mQWidth / 10,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Health"),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/icons/categories/flight.png',
                      width: mQWidth / 10,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Flight"),
                  )
                ],
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.fromLTRB(
                mQWidth / 1.8,
                mQHeight / 200,
                0,
                mQHeight / 200,
              ),
              child: TextButton(
                child: const Text('View All >'),
                onPressed: () {},
              )),
        ],
      ),
    );
  }
}
