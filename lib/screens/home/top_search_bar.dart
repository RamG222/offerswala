import 'package:flutter/material.dart';

class top_search_bar extends StatelessWidget {
  const top_search_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;

    return Column(
      children: [
        Container(
          width: mQWidth,
          height: mQHeight / 15,
          decoration: BoxDecoration(
            color: const Color(0xffBA172F),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: mQWidth / 1.25,
                height: mQHeight / 23,
                child: SearchBar(
                  shape: MaterialStatePropertyAll(
                    BeveledRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3),
                            bottomLeft: Radius.circular(3))),
                  ),
                  constraints: BoxConstraints(maxHeight: mQHeight / 20),
                  hintText: 'Search Offerswala.in',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
