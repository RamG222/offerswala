import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class top_search_bar extends StatelessWidget {
  const top_search_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;

    var dataFromAPI = ['10-30 %', 'Flash Deals', '50% off', 'New Deals'];
    return Column(
      children: [
        Container(
          width: mQWidth,
          height: mQHeight / 18,
          decoration: BoxDecoration(
            color: const Color(0xffBA172F),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: mQWidth / 1.25,
                height: mQHeight / 31,
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
        Container(
          height: mQHeight / 20,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 217, 211, 211),
          ),
          child: Row(
            children: [
              Container(
                width: mQWidth / 1.25,
                height: mQHeight / 28,
                child: ListView.builder(
                  itemCount: dataFromAPI.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: mQWidth / 100,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            dataFromAPI[index],
                            style: TextStyle(
                              color: const Color(0xffBA172F),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: mQHeight / 30,
                width: mQWidth / 5,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(child: Text('Filter 🔽')),
              )
            ],
          ),
        )
      ],
    );
  }
}
