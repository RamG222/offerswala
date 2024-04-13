import 'package:flutter/material.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'All Categories',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: mQHeight / 40,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: mQHeight / 80,
          ),
        ],
      ),
    ));
  }
}
