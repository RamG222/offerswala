import 'package:flutter/material.dart';

class topDealsBar extends StatelessWidget {
  var dataFromAPI = [
    '10-30 %',
    'Flash Deals',
    '50% off',
    'New Deals',
    '10-30 %',
    'Flash Deals',
    '50% off',
    'New Deals'
  ];
  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;

    return Container(
      height: mQHeight / 17,
      color: Color.fromARGB(255, 217, 211, 211),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataFromAPI.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(mQWidth / 60),
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  dataFromAPI[index],
                  style: TextStyle(
                    color: const Color(0xffBA172F),
                    fontWeight: FontWeight.bold,
                  ),
                )),
          );
        },
      ),
    );
  }
}
