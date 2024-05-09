import 'package:flutter/material.dart';
import 'package:offerswala/api/const.dart';
import 'package:offerswala/models/grid.dart';
import 'package:offerswala/screens/login.dart';

List<GridModel> grids = [];

class bottomImageGrid extends StatefulWidget {
  const bottomImageGrid({
    super.key,
    required this.mQWidth,
  });

  final double mQWidth;

  @override
  State<bottomImageGrid> createState() => _bottomImageGridState();
}

class _bottomImageGridState extends State<bottomImageGrid> {
  late Future<List<GridModel>> _futureGrid;
  @override
  void initState() {
    _futureGrid = getGridData();
    super.initState();
  }

  Future<List<GridModel>> getGridData() async {
    var responseGrid = await dio.get(getGrid);
    var apidata = responseGrid.data['activity'];

    setState(() {
      for (var item in apidata) {
        GridModel gridModel = GridModel(
          gridID: item['ACTID'],
          cityID: List<String>.from(item['CTID']),
          imageURL: item['act_img'],
        );
        grids.add(gridModel);
      }
    });
    return grids;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureGrid,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
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
                      Image.network(
                        imgURL + grids[0].imageURL,
                        width: widget.mQWidth / 2.4,
                      ),
                      Image.network(
                        imgURL + grids[1].imageURL,
                        width: widget.mQWidth / 2.4,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                        imgURL + grids[2].imageURL,
                        width: widget.mQWidth / 2.4,
                      ),
                      Image.network(
                        imgURL + grids[3].imageURL,
                        width: widget.mQWidth / 2.4,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
