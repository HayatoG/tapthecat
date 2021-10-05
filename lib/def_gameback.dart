import 'package:cats_against_the_tap/main.dart';
import 'package:flutter/material.dart';

titleCoins(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.1,
    child: Center(
        child: Text(
      'Cat coins: $counter',
      style: TextStyle(
          fontSize: 40, height: MediaQuery.of(context).size.height * 0.003),
    )),
  );
}

