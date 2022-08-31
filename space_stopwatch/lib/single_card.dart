import 'package:flutter/material.dart';

import 'constants.dart';

class SingleCard extends StatelessWidget {
  SingleCard({required this.imageInt});

  int imageInt;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 25),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 15.0,
          shadowColor: Constants.baseColor(),
          color: Constants.baseColor(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              'images/$imageInt.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
