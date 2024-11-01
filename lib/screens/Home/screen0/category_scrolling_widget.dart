import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:offerswala/api/const.dart';
import 'package:offerswala/models/category.dart';
import 'package:offerswala/screens/login.dart';

List<CategoryModel> categories = [];

class CategoryScrollingWidget extends StatefulWidget {
  const CategoryScrollingWidget({super.key});

  @override
  State<CategoryScrollingWidget> createState() =>
      _CategoryScrollingWidgetState();
}

class _CategoryScrollingWidgetState extends State<CategoryScrollingWidget> {
  late Future<List<CategoryModel>> _categoryFuture;

  @override
  void initState() {
    super.initState();
    _categoryFuture = getCategoryData();
  }

  Future<List<CategoryModel>> getCategoryData() async {
    try {
      var responseCat = await dio.get(getCategoriesData);
      List<CategoryModel> categories = [];
      (responseCat.data['category'] as List).forEach((categoryData) {
        categories.add(CategoryModel(
          categoryID: categoryData['CID'],
          categoryName: categoryData['Category'],
          categoryURL: categoryData['Categoryurl'],
        ));
      });
      return categories;
    } catch (e) {
      return []; // handle error accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;

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
                  'Top Categories',
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
          FutureBuilder<List<CategoryModel>>(
            future: _categoryFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // show loading indicator while fetching data
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<CategoryModel> categories = snapshot.data ?? [];
                return SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      var catData = categories[index];
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
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.network(
                                    imgURL + catData.categoryURL,
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                                AutoSizeText(
                                  catData.categoryName,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11),
                                ),
                                const SizedBox(height: 2)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
