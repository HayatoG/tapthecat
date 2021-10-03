import 'dart:async';

import 'package:cats_against_the_tap/main.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class store_page extends StatefulWidget {
  const store_page({Key? key}) : super(key: key);

  @override
  _store_pageState createState() => _store_pageState();
}

class _store_pageState extends State<store_page> {
  bool isAutomatic = false;
  Timer? timer;
  Timer? autoTimer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOJINHA"),
      ),
      body: ListTile(
        leading: Icon(Icons.monetization_on_rounded),
        title: Text('+2 Dinheiros'),
        subtitle: Text('Custa: 5 dinheiros.'),
        onLongPress: () {
          toast('Te dá +2 moedas durante 5 segundos');
        },
        onTap: () {
          debugPrint('Moedas atuais: $counter');
          if (wasPressed == false && counter >= 5) {
            counter -= 5;
            debugPrint('Compra feita --- Moedas atuais $counter');
            wasPressed = true;
            timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
              counter += 2;
              debugPrint('Moedas: $counter');
              Timer(const Duration(seconds: 5), () {
                wasPressed = false;
                timer.cancel();
              });
              Navigator.pop(context, counter);
            });
          }
          ;
          if (wasPressed == false || counter < 5) {
            showSimpleNotification(
              Text("Você tem $counter dinheiros\nVocê precisa de 5 dinheiros"),
              background: Colors.red,
              slideDismissDirection: DismissDirection.up,
            );
          }
        },
      ),
    );
  }
}
