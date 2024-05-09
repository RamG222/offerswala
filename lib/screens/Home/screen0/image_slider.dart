import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:offerswala/api/const.dart';
import 'package:offerswala/models/image_slider.dart';
import 'package:offerswala/screens/login.dart';

List<ImageSliderModel> imageSliderList = [];

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
    required this.cityID,
    required this.mQWidth,
    required this.mQHeight,
  });

  final double mQWidth;
  final double mQHeight;
  final String cityID;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late Future<List<ImageSliderModel>> _futureImageSlider;
  @override
  void initState() {
    print('Inside InitState ImageSlider');
    _futureImageSlider = getImageSliderData();
    super.initState();
  }

  @override
  void dispose() {
    print('Inside Dispose ImageSlider');
    imageSliderList.clear();
    super.dispose();
  }

  Future<List<ImageSliderModel>> getImageSliderData() async {
    try {
      var responseImageSlider = await dio.get(getImageSliderApiData);
      List<dynamic> sliderAds = responseImageSlider.data['slider_ads'];

      setState(() {
        for (var sliderAd in sliderAds) {
          String sliderId = sliderAd['SLID'];
          List<String> cityIDs = List<String>.from(sliderAd['CTID']);
          String imageUrl = sliderAd['Slider_ads_img'];
          if (cityIDs.contains(widget.cityID)) {
            imageSliderList.add(ImageSliderModel(
              sliderID: sliderId,
              cityId: cityIDs,
              imageURL: imageUrl,
            ));
          }
        }
      });

      if (imageSliderList.isEmpty) {
        imageSliderList.add(ImageSliderModel(
            sliderID: '0',
            cityId: ['0'],
            imageURL: 'img/sliderAds/slider 45.jpg'));
      }
      return imageSliderList;
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureImageSlider,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ImageSlideshow(
              height: double.infinity,
              autoPlayInterval: 7100,
              isLoop: true,
              children: imageSliderList.map((slider) {
                return InkWell(
                  child: Image.network(
                    imgURL + slider.imageURL,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    Get.snackbar("Slider ID ${slider.sliderID}", 'message');
                  },
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
