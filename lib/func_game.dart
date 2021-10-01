import 'dart:async';

import 'package:cats_against_the_tap/ad_helper.dart';
import 'package:cats_against_the_tap/gamepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:overlay_support/overlay_support.dart';

class GamePageState extends State<GamePage> {
  Image img = Image.asset('images/BocaFechada.png');
  Timer? timer;
  Timer? autoTimer;
  double counter = 0;
  bool wasPressed = false;
  bool isAutomatic = false;
  Image OpenMouth = Image.asset('images/BocaAberta.png');
  Image CloseMouth = Image.asset('images/BocaFechada.png');

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
  }

  void dispose() {
    _bannerAd.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dinheiros: $counter'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home_rounded,)),
              Tab(icon: Icon(Icons.add_shopping_cart_rounded),),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1265,
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
                  Navigator.pop(context);
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
                  if (wasPressed == false || counter < 5) {
                    showSimpleNotification(
                      Text(
                          "Você tem $counter dinheiros\nVocê precisa de 5 dinheiros"),
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
                  Navigator.pop(context);
                  if (counter >= 30 && isAutomatic == false) {
                    isAutomatic = true;
                    counter -= 30;
                    debugPrint('Ativou clique automático');
                    autoTimer =
                        Timer.periodic(const Duration(seconds: 1), (timer) {
                      setState(() {
                        counter += 1;
                        debugPrint('Moedas: $counter');
                      });
                    });
                  } else {
                    showSimpleNotification(
                      Text(
                          "Você tem $counter dinheiros\nVocê precisa de 30 dinheiros\nou já comprou essa função!"),
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
                  isAutomatic = false;
                  debugPrint('Cancelando contador e zerando dinheirinhos');
                  debugPrint('Moedas atuais: $counter');
                  setState(() {
                    autoTimer?.cancel();
                    counter = 0;
                    debugPrint('Moedas após cancelar: $counter');
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),
            body: SafeArea(
            child: Stack(
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
                    if (_isBannerAdReady == true)
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: _bannerAd.size.width.toDouble(),
                          height: _bannerAd.size.height.toDouble(),
                          child: AdWidget(ad: _bannerAd),
                        ),
                      ),
                  ],
            ),
          ),
      ),
    );
  }
}
