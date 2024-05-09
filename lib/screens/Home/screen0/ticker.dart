import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offerswala/api/const.dart';
import 'package:offerswala/models/ticker.dart';
import 'package:offerswala/screens/login.dart';

List<TickerModel> tickers = [];

class Ticker extends StatefulWidget {
  const Ticker({
    super.key,
  });

  @override
  State<Ticker> createState() => _TickerState();
}

class _TickerState extends State<Ticker> {
  late Future<List<TickerModel>> _futureTicker;
  @override
  void initState() {
    _futureTicker = getTickerData();
    super.initState();
  }

  Future<List<TickerModel>> getTickerData() async {
    var responseTicker = await dio.get(getTicker);
    var apiData = responseTicker.data['ticker'];
    setState(() {
      for (var data in apiData) {
        TickerModel ticker = TickerModel(
          tickerID: data['TIKID'],
          cityID: List<String>.from(data['CTID']),
          imageURL: data['ticker_img'],
        );
        tickers.add(ticker);
      }
    });
    return tickers;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureTicker,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          return CarouselSlider(
            options: CarouselOptions(height: 150.0),
            items: tickers.map((index) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: InkWell(
                      child: Image.network(imgURL + index.imageURL),
                      onTap: () {
                        Get.snackbar("Ticker id ", index.tickerID);
                      },
                    ),
                  );
                },
              );
            }).toList(),
          );
        }
      },
    );
  }
}
