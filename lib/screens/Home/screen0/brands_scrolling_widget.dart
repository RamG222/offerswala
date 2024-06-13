import 'package:flutter/material.dart';
import 'package:offerswala/api/const.dart';
import 'package:offerswala/models/brand.dart';
import 'package:offerswala/screens/login.dart';

List<BrandModel> brands = [];

class BrandsScrollingWidget extends StatefulWidget {
  const BrandsScrollingWidget({
    super.key,
    required this.cityId,
  });

  final String cityId;

  @override
  State<BrandsScrollingWidget> createState() => _BrandsScrollingWidgetState();
}

class _BrandsScrollingWidgetState extends State<BrandsScrollingWidget> {
  late Future<List<BrandModel>> _brandsFuture;
  @override
  void initState() {
    if (brands.isEmpty) {
      _brandsFuture = getBrandData();
    }
    super.initState();
  }

  @override
  void dispose() {
    brands.clear();
    super.dispose();
  }

  Future<List<BrandModel>> getBrandData() async {
    try {
      var responseBrand = await dio.get(getBrandsData);

      setState(() {
        (responseBrand.data['brands'] as List).forEach((brandData) {
          List<dynamic> cityIDs = brandData['CTID'];
          List<String> cityIDsAsString =
              cityIDs.map((id) => id.toString()).toList();

          if (cityIDsAsString.contains(widget.cityId)) {
            brands.add(
              BrandModel(
                bID: brandData['BID'],
                bName: brandData['brandname'],
                bURL: brandData['brandimg'],
                cityIDs: cityIDsAsString,
              ),
            );
          }
        });
      });
      return brands;
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;

    return FutureBuilder(
      future: _brandsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          return Container(
            margin: const EdgeInsets.fromLTRB(14, 0, 14, 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 4),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: mQWidth / 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top Brands',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'View All >',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: brands.length,
                    itemBuilder: (context, index) {
                      var catData = brands[index];
                      return Card(
                        surfaceTintColor: Colors.white,
                        color: Colors.white,
                        margin: const EdgeInsets.all(8),
                        elevation: 5,
                        child: InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: mQWidth / 5.5,
                            height: mQWidth / 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  imgURL + catData.bURL,
                                  width: mQWidth / 6,
                                  height: mQWidth / 6,
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(height: 2)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10)
              ],
            ),
          );
        }
      },
    );
  }
}
