import 'dart:async';

import 'package:cats_against_the_tap/def_botoes.dart';
import 'package:cats_against_the_tap/def_gameback.dart';
import 'package:cats_against_the_tap/main.dart';
import 'package:flutter/material.dart';

class gamepage extends StatefulWidget {
  const gamepage({Key? key}) : super(key: key);

  @override
  gamepageState createState() => gamepageState();
}

class gamepageState extends State<gamepage> {
  void update(double count) {
    setState(() => counter = count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Cat coins: $counter'),),
      body: SafeArea(
        child: Stack(
          children: [
            titleCoins(context),
            cat(context),
            Container(alignment: Alignment.bottomCenter, child: buttonLoja(context)),
          ],
        ),
      ),
    );
  }

  cat(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: img,
        onTapUp: (tap) {
          img = CloseMouth;
          counter++;
          update(counter);
          debugPrint('Abriu a boca e atualizou\n$counter cat coins');
        },
        onTapDown: (tap) {
          img = OpenMouth;
          update(counter);
          debugPrint('Abriu a boca e atualizou');
        },
        onTapCancel: () {
          update(counter);
          img = CloseMouth;
          debugPrint('Cancelou, fechou a boca e atualizou');
        },
      ),
    );
  }
}
