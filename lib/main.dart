import 'package:flutter/material.dart';
import 'ma_page.dart';

// call of functions which is in the page "my_page" thanks to 'Home'
void main() {
  runApp(const MyApp());
}
//Principal
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext test) {
    return MaterialApp( //MaterialApp is a Flutter class that provides a material design layout
      debugShowCheckedModeBanner: false,// this allows you to remove the debug banner
      theme: ThemeData(
      ),
      home: pageacceuil(),//we call the function, in the file 'my_page'

    );
  }
}



