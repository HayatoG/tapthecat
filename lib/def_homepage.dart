import 'package:cats_against_the_tap/ad_helper.dart';
import 'package:cats_against_the_tap/def_botoes.dart';
import 'package:cats_against_the_tap/main.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class def_homepage extends StatefulWidget {
  const def_homepage({Key? key}) : super(key: key);

  @override
  _def_homepageState createState() => _def_homepageState();
}

class _def_homepageState extends State<def_homepage> {
  @override
  void initState() {
    bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    bannerAd.load();
  }

  void dispose() {
    bannerAd.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('HomePage'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: buttonIniciar(context),
          ),
          Center(
            child: buttonCreditos(context),
          ),
          if (isBannerAdReady == true)
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: bannerAd.size.width.toDouble(),
                height: bannerAd.size.height.toDouble(),
                child: AdWidget(ad: bannerAd),
              ),
            ),
        ],
      ),
    );
  }
}
