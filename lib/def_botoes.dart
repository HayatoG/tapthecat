import 'package:cats_against_the_tap/def_gamepage.dart';
import 'package:cats_against_the_tap/def_storepage.dart';
import 'package:flutter/material.dart';

buttonIniciar(BuildContext context) {
  return TextButton(
    onPressed: () {
      debugPrint('Apertou botão Iniciar');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => gamepage(),
        ),
      );
    },
    child: Text('Iniciar'),
    style: styleButtons(context),
  );
}

buttonCreditos(BuildContext context) {
  return TextButton(
    onPressed: () {
      debugPrint('Apertou o botão Créditos');
    },
    child: Text('Créditos'),
    style: styleButtons(context),
  );
}

buttonLoja(BuildContext context) {
  return TextButton(
    onPressed: () {
      final valor = Navigator.push(
          context, MaterialPageRoute(builder: (context) => storepage()));
    },
    onLongPress: () {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Esta é a loja onde você poderá comprar melhorias!')));
    },
    child: Text('Loja'),
    style: styleButtons(context),
  );
}

styleButtons(BuildContext context) {
  return TextButton.styleFrom(
    backgroundColor: Colors.red,
    textStyle: TextStyle(fontSize: 20),
    primary: Colors.white,
    enableFeedback: true,
    minimumSize: Size(MediaQuery.of(context).size.width * 0.5,
        MediaQuery.of(context).size.height * 0.05),
    maximumSize: Size(MediaQuery.of(context).size.width * 0.8,
        MediaQuery.of(context).size.height * 0.10),
  );
}
