import 'package:cats_against_the_tap/def_initpage.dart';
import 'package:cats_against_the_tap/gamepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

double counter = 0.0;
late int valor;
bool wasPressed = false;
bool shopCalled = false;
Image img = OpenMouth;
Image imgTemp = img;
Image OpenMouth = Image.asset('images/BocaAberta.png');
Image CloseMouth = Image.asset('images/BocaFechada.png');

late BannerAd bannerAd;
bool isBannerAdReady = false;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(initPage());
}
