import 'package:flutter/material.dart';
import 'package:offerswala/api/const.dart';
import 'package:offerswala/models/seasons.dart';
import 'package:offerswala/screens/login.dart';

List<SeasonsModel> seasons = [];

class SeasonsBar extends StatefulWidget {
  const SeasonsBar({
    super.key,
    required this.mQWidth,
  });
  final double mQWidth;

  @override
  State<SeasonsBar> createState() => _SeasonsBarState();
}

class _SeasonsBarState extends State<SeasonsBar> {
  late Future<List<SeasonsModel>> _futureSeasons;
  @override
  void initState() {
    _futureSeasons = getSeasonsData();
    super.initState();
  }

  Future<List<SeasonsModel>> getSeasonsData() async {
    final responseSeasons = await dio.get(getSeasons);
    var apiData = responseSeasons.data['seasons'];
    print('Print APIDATA +$apiData');
    setState(() {
      for (var data in apiData) {
        SeasonsModel data2 = SeasonsModel(
          sID: data['SEAID'],
          cityID: List<String>.from(data['CTID']),
          imageURL: data['seasons_photo'],
        );
        seasons.add(data2);
      }
    });
    return seasons;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureSeasons,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return Column(
              children: [
                const SizedBox(height: 45),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            transform: GradientRotation(1.5708),
                            tileMode: TileMode.clamp,
                            colors: [
                              Colors.white,
                              Colors.white,
                              Colors.blueAccent,
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.network(
                                  imgURL + seasons[0].imageURL,
                                  width: widget.mQWidth / 3.5,
                                ),
                                Image.network(
                                  imgURL + seasons[1].imageURL,
                                  width: widget.mQWidth / 3.5,
                                ),
                                Image.network(
                                  imgURL + seasons[2].imageURL,
                                  width: widget.mQWidth / 3.5,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(100, -50),
                      child: Image.asset(
                        'assets/images/Monsoon-Title.png',
                        width: widget.mQWidth / 2,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        });
  }
}
