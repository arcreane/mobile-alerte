import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilealerte/recipeListScreen.dart';
import 'package:shadow/shadow.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            decoration: BoxDecoration( //allows you to put an image in the background of our application
                image: DecorationImage(
                    image: AssetImage("images/FOND_03.png"), fit: BoxFit.cover)),
   child: Scaffold(
        appBar: AppBar(
          //AppBar includes a Tool Bar and other potential Widgets
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF009075)

              ),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RecipeListScreen()),
                );
              }),

        ),
        body: Stack(
            children: <Widget>[
              Container(
                color: Color.fromRGBO(208, 208, 208, 0.5),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(height: 1, width: 1,),
                      ],

                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 18),
                      child: Text('Rappel', style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),),
                    ),
                    Text('Ne pas oublie',
                      style: TextStyle(fontSize: 18, color: Colors.black54),),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Shadow(child: Image.asset(
                        'images/clock.png', scale: 3, color: Colors.black,)),
                    ),

                  ],

                ),
              ),

            ])


    )

                  )

    );}
}