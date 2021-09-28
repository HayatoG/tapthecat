import 'dart:async';

import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sizer/sizer.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return OverlaySupport(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            home: GamePage(),
          ),
        );
      },
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GamePageState();
  }
}

class GamePageState extends State<GamePage> {
  Image img = Image.asset('images/BocaFechada.png');
  Timer? timer;
  Timer? autoTimer;
  double counter = 0;
  bool wasPressed = false;
  bool isAutomatic = false;
  Image OpenMouth = Image.asset('images/BocaAberta.png');
  Image CloseMouth = Image.asset('images/BocaFechada.png');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Dinheiros: $counter'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 15.h,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Loja',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.monetization_on_rounded),
              title: const Text('+2 moedas'),
                onTap: () {
                  debugPrint('Moedas atuais: $counter');
                  if (wasPressed == false && counter >= 5) {
                    counter -= 5;
                    debugPrint('Compra feita --- Moedas atuais $counter');
                    wasPressed = true;
                    timer = Timer.periodic(const Duration(milliseconds: 500),
                        (timer) {
                      setState(() {
                        counter += 2;
                        debugPrint('Moedas: $counter');
                      });
                      Timer(const Duration(seconds: 5), () {
                        wasPressed = false;
                        timer.cancel();
                      });
                    });
                  };
                  if(wasPressed == false || counter < 5){
                    showSimpleNotification(
                      Text("Você tem $counter dinheiros\nVocê precisa de 5 dinheiros"),
                      background: Colors.red,
                      slideDismissDirection: DismissDirection.up,
                    );
                  }
                },
            ),
            ListTile(
              leading: Icon(Icons.play_arrow_rounded),
              title: const Text('Cliques automáticos'),
              onTap: () {
                if(counter >= 30 && isAutomatic == false){
                  isAutomatic = true;
                  counter -=30;
                  debugPrint('Ativou clique automático');
                  autoTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
                    setState(() {
                      counter+=1;
                      debugPrint('Moedas: $counter');
                    });
                  });
                } else {
                  showSimpleNotification(
                    Text("Você tem $counter dinheiros\nVocê precisa de 30 dinheiros\nou já comprou essa função!"),
                    background: Colors.red,
                    slideDismissDirection: DismissDirection.up,
                  );
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.cancel_rounded),
              title: const Text('Zerar jogo'),
                onTap: () {
                  debugPrint('Cancelando contador e zerando dinheirinhos');
                  debugPrint('Moedas atuais: $counter');
                  setState(() {
                    timer?.cancel();
                    counter = 0;
                    debugPrint('Moedas após cancelar: $counter');
                  });
                },
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: GestureDetector(
                child: img,
                onTapUp: (tap) {
                  setState(() {
                    img = CloseMouth;
                  });
                },
                onTapDown: (tap) {
                  setState(() {
                    img = OpenMouth;
                    counter++;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    img = CloseMouth;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
