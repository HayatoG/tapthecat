import 'package:flutter/material.dart';

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
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RichText(
            text: TextSpan(
              text: 'Página Inicial',
              style: DefaultTextStyle.of(context).style,
            ),
          ),
        ),
      ),
    );
  }
}