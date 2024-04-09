// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Categories_Card extends StatelessWidget {
  const Categories_Card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    var mQHeight = mQSize.height;
    var mQWidth = mQSize.width;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      elevation: 5,
      child: Column(
        children: [
          SizedBox(
            height: mQHeight / 100,
          ),
          const Text('Top Categories'),
          SizedBox(
            height: mQHeight / 100,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.local_grocery_store,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Groceries"),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.local_grocery_store,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Groceries"),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.local_grocery_store,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Groceries"),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.local_grocery_store,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Groceries"),
                  )
                ],
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.local_grocery_store,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Groceries"),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.local_grocery_store,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Groceries"),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.local_grocery_store,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Groceries"),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.local_grocery_store,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Groceries"),
                  )
                ],
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.fromLTRB(
                mQWidth / 1.8,
                mQHeight / 200,
                0,
                mQHeight / 200,
              ),
              child: TextButton(
                child: const Text('View All >'),
                onPressed: () {},
              )),
        ],
      ),
    );
  }
}
