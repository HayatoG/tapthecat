import 'package:cats_against_the_tap/def_storepage.dart';
import 'package:flutter/material.dart';
import 'package:cats_against_the_tap/def_homepage.dart';

class initPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), 
    initialRoute: 'home', routes: {
      'home': (context) => def_homepage(),
      'store': (context) => storepage(),
    });
  }
}
