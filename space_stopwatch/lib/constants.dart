import 'package:flutter/material.dart';
import 'package:space_stopwatch/single_card.dart';

class Constants {
  static List<Widget> widgets() {
    return [
      SingleCard(imageInt: 0),
      SingleCard(imageInt: 1),
      SingleCard(imageInt: 2),
      SingleCard(imageInt: 3),
      SingleCard(imageInt: 4),
      SingleCard(imageInt: 5),
      SingleCard(imageInt: 6),
      SingleCard(imageInt: 7),
      SingleCard(imageInt: 8),
      SingleCard(imageInt: 9),
    ];
  }

  static Color baseColor() {
    return const Color(0xff570081);
  }

  static Color tintColor() {
    return const Color(0xfffbf3ff);
  }
}
