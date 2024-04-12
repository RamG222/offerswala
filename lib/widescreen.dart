// check if device tablet or web
import 'package:flutter/material.dart';

bool isWideScreen(context) {
  if (MediaQuery.of(context).size.width > 800) {
    return true;
  } else {
    return false;
  }
}
