import 'package:flutter/material.dart';
import 'package:offerswala/screens/home/categories_card.dart';
import 'package:offerswala/screens/home/image_slider.dart';
import 'package:offerswala/screens/home/top_brands_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    bool isWideScreen() {
      if (mQWidth < 800) {
        return true;
      } else {
        return false;
      }
    }

    return SafeArea(
      child: isWideScreen()
          ? Scaffold(
              drawer: Drawer(
                backgroundColor: const Color.fromARGB(255, 226, 215, 217),
                child: Column(
                  children: [
                    SizedBox(height: mQHeight / 20),
                    Image.asset(
                      "assets/images/logo.png",
                      width: mQWidth / 2,
                    ),
                    SizedBox(height: mQHeight / 18),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('My Profile')),
                    SizedBox(height: mQHeight / 130),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Offers')),
                    SizedBox(height: mQHeight / 5),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Log out')),
                  ],
                ),
              ),
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Color(0xffBA172F)),
                title: TextButton(
                  onPressed: () {},
                  child: Expanded(
                    child: Row(
                      children: [
                        Image.asset('assets/images/logo.png',
                            width: mQWidth / 10),
                        SizedBox(
                          width: mQWidth / 20,
                        ),
                        const Text('Current Location:'),
                        SizedBox(width: mQWidth / 25),
                        const Text('Mumbai'),
                      ],
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: mQWidth / 20, vertical: mQHeight / 75),
                      child: const SearchBar(
                        hintText: 'Search',
                      ),
                    ),
                    const Image_slider(),
                    const Categories_Card(),
                    SizedBox(height: mQHeight / 100),
                    const Top_Brands_card()
                  ],
                ),
              ),
            )
          : const Scaffold(),
    );
  }
}
