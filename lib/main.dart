import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(TapTheCat());
}

class TapTheCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageScreen(),
    );
  }
}

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tap the Cat'),
      ),
      body: Column(
        children: [
          Image.network('https://assets.wallpapersin4k.org/uploads/2017/05/Keyboard-Cat-Wallpaper-24.jpg'),
          Center(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: ElevatedButton(onPressed: () { },
                    child: Text('Começar'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: ElevatedButton(onPressed: () { },
                    child: Text('Opções'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: ElevatedButton(onPressed: () { },
                    child: Text('Sobre'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}