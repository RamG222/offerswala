import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

var suggestion = ['a', 'b', 'c', 'd'];

class SearchBox extends StatelessWidget {
  SearchBox({super.key, required this.mQWidth, required this.mQHeight});

  final double mQWidth;
  final double mQHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: mQWidth / 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: SearchField(
        onSearchTextChanged: (query) {
          final filter = suggestion
              .where((element) => element
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()))
              .toList();
          return filter
              .map((e) => SearchFieldListItem<String>(e,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(e),
                  )))
              .toList();
        },
        hint: 'Search',
        itemHeight: 50,
        searchInputDecoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          hintStyle: TextStyle(),
        ),
        suggestionsDecoration: SuggestionDecoration(
            padding: const EdgeInsets.all(4),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
        suggestions: [],
      ),
    );
  }
}
