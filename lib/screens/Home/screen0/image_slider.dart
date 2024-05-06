import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:offerswala/api/const.dart';
import 'package:offerswala/models/image_slider.dart';
import 'package:offerswala/screens/login.dart';

List<ImageSliderModel> imageSliderList = [];
const imgSliderURL = 'http://192.168.1.5/offerswala/';

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
  @override
  void initState() {
    print('Inside InitState ImageSlider');
    getImageSliderData();
    super.initState();
  }

  @override
  void dispose() {
    print('Inside Dispose ImageSlider');
    imageSliderList.clear();
    super.dispose();
  }

  void getImageSliderData() async {
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
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ImageSlideshow(
        height: double.infinity,
        autoPlayInterval: 7100,
        isLoop: true,
        children: imageSliderList.map((slider) {
          return InkWell(
            child: Image.network(
              imgSliderURL + slider.imageURL,
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
}
