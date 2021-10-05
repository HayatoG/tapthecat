import 'dart:async';

import 'package:cats_against_the_tap/main.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class store_page extends StatelessWidget {
  //const store_page({Key? key}) : super(key: key);
  final ValueChanged<double> update;
  store_page({required this.update});

  bool isAutomatic = false;
  Timer? timer;
  Timer? autoTimer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOJINHA"),
      ),
      body: maisDuasMoedas(context),
    );
  }

  ListTile maisDuasMoedas(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.monetization_on_rounded),
      title: const Text('+2 Dinheiros'),
      subtitle: const Text('Custa: 5 dinheiros.'),
      onLongPress: () {
        toast('Te dá +2 moedas durante 5 segundos');
      },
      onTap: () {
        debugPrint('Moedas atuais: $counter');
        if (wasPressed == false && counter >= 5) {
          Navigator.pop(context, valor);
          counter -= 5;
          debugPrint('Compra feita --- Moedas atuais $counter');
          wasPressed = true;
          timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
            counter += 2;
            debugPrint('Moedas: $counter');
            Timer(const Duration(seconds: 5), () {
              wasPressed = false;
              shopCalled = true;
              timer.cancel();
            });
            
            
          });
        }
        if (wasPressed == false || counter < 5) {
          showSimpleNotification(
            Text("Você tem $counter dinheiros\nVocê precisa de 5 dinheiros"),
            background: Colors.red,
            slideDismissDirection: DismissDirection.up,
          );
        }
      },
    );
  }
}
