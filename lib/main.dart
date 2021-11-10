import 'package:flutter/material.dart';
import 'ma_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,// Cela permet d'enlever le debug de l'application par defaut
      title: 'Page accueil',
      home: pageacceuil (),
    );
  }
}


