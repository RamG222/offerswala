import 'package:flutter/material.dart';

Future<bool> onback(BuildContext context) async {
  bool? exitApp = await showDialog(
    context: context,
    builder: ((context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 255, 233, 233),
        title: const Text('Do you Want to Exit App?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('No',
                style: TextStyle(color: const Color(0xffBA172F))),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Yes',
                style: TextStyle(color: const Color(0xffBA172F))),
          ),
        ],
      );
    }),
  );

  return exitApp ?? false;
}
