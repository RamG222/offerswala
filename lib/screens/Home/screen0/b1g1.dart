import 'package:flutter/material.dart';
import 'package:offerswala/api/const.dart';
import 'package:offerswala/models/b1g1.dart';
import 'package:offerswala/screens/login.dart';

List<B1G1Model> b1g1s = [];

class B1G1card extends StatefulWidget {
  const B1G1card({
    super.key,
    required this.mQWidth,
  });

  final double mQWidth;

  @override
  State<B1G1card> createState() => _B1G1cardState();
}

class _B1G1cardState extends State<B1G1card> {
  late Future<List<B1G1Model>> _futureB1G1;
  @override
  void initState() {
    _futureB1G1 = getB1G1Data();
    super.initState();
  }

  Future<List<B1G1Model>> getB1G1Data() async {
    var responseB1G1 = await dio.get(getB1g1);
    var apiData = responseB1G1.data['circle_offers'];
    setState(() {
      for (var data in apiData) {
        B1G1Model b1g1 = B1G1Model(
          id: data['CIRID'],
          cityID: List<String>.from(data['CTID']),
          imageURL: data['circle_img'],
        );
        b1g1s.add(b1g1);
      }
    });
    return b1g1s;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureB1G1,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          return Card(
            surfaceTintColor: Colors.white,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.network(
                    imgURL + b1g1s[0].imageURL,
                    width: widget.mQWidth / 5.5,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.network(
                    imgURL + b1g1s[1].imageURL,
                    width: widget.mQWidth / 5.5,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.network(
                    imgURL + b1g1s[2].imageURL,
                    width: widget.mQWidth / 5.5,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.network(
                    imgURL + b1g1s[3].imageURL,
                    width: widget.mQWidth / 5.5,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
