import 'package:flutter/material.dart';
import 'ma_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,// cela permet d'enlever la bannière de debug
      theme: ThemeData(
      ),
      home: pageacceuil(),
    );
  }
}



