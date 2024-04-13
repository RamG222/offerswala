import 'package:flutter/material.dart';
import 'package:offerswala/screens/all_categories.dart';

class categories_widget extends StatefulWidget {
  const categories_widget({super.key});

  @override
  State<categories_widget> createState() => _categories_widgetState();
}

class _categories_widgetState extends State<categories_widget> {
  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    return Column(
      children: [
        SizedBox(
          height: mQHeight / 80,
        ),
        Text(
          "Top Categories",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: mQHeight / 40,
            color: const Color(0xffBA172F),
          ),
        ),
        SizedBox(
          height: mQHeight / 50,
        ),
        SizedBox(
          width: mQWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: mQWidth / 5,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/icons/categories/Accessory.png",
                      width: mQWidth / 7,
                    ),
                    SizedBox(
                      height: mQHeight / 100,
                    ),
                    Text(
                      'Accessory',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: mQWidth / 5,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/icons/categories/Agriculture.png",
                      width: mQWidth / 7,
                    ),
                    SizedBox(
                      height: mQHeight / 100,
                    ),
                    Text(
                      'Agriculture',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: mQWidth / 5,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/icons/categories/Architect.png",
                      width: mQWidth / 7,
                    ),
                    SizedBox(
                      height: mQHeight / 100,
                    ),
                    Text(
                      'Architect',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: mQWidth / 5,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/icons/categories/Apparels.png",
                      width: mQWidth / 7,
                    ),
                    SizedBox(
                      height: mQHeight / 100,
                    ),
                    Text(
                      'Apparels',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: mQWidth / 5,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/icons/categories/Beauty-Spa.png",
                      width: mQWidth / 7,
                    ),
                    SizedBox(
                      height: mQHeight / 100,
                    ),
                    Text(
                      'Spa',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: mQHeight / 50,
        ),
        SizedBox(
          width: mQWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: mQWidth / 5,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/icons/categories/Chemists.png",
                      width: mQWidth / 7,
                    ),
                    SizedBox(
                      height: mQHeight / 100,
                    ),
                    Text(
                      'Chemists',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: mQWidth / 5,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/icons/categories/Computer.png",
                      width: mQWidth / 7,
                    ),
                    SizedBox(
                      height: mQHeight / 100,
                    ),
                    Text(
                      'Computer',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: mQWidth / 5,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/icons/categories/Consulatants.png",
                      width: mQWidth / 7,
                    ),
                    SizedBox(
                      height: mQHeight / 100,
                    ),
                    Text(
                      'Consultants',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: mQWidth / 5,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/icons/categories/Doctors.png",
                      width: mQWidth / 7,
                    ),
                    SizedBox(
                      height: mQHeight / 100,
                    ),
                    Text(
                      'Doctors',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: mQWidth / 5,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/icons/categories/Education.png",
                      width: mQWidth / 7,
                    ),
                    SizedBox(
                      height: mQHeight / 100,
                    ),
                    Text(
                      'Education',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(mQWidth / 1.5, 0, 0, 0),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllCategories(),
                  ));
            },
            child: Text(
              'View All >',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: mQHeight / 55,
                color: const Color(0xffBA172F),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
