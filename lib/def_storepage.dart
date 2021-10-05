import 'dart:async';

import 'package:cats_against_the_tap/main.dart';
import 'package:flutter/material.dart';

class storepage extends StatefulWidget {
  const storepage({Key? key}) : super(key: key);

  @override
  _storepageState createState() => _storepageState();
}

class _storepageState extends State<storepage> {
  Timer? timer;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        child: ListTile(
          leading: Icon(Icons.monetization_on_rounded),
          title: Text('+2 dinheiros'),
          onTap: () {
            valor = 1;
            Navigator.pop(context, valor);
            timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
              counter += 2;
              debugPrint('Moedas: $counter');
              Timer(const Duration(seconds: 5), () {
                wasPressed = false;
                shopCalled = true;
                timer.cancel();
              });
            });
          },
        ),
      ),
    );
  }
}
