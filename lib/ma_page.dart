
import 'package:flutter/material.dart';


//mettre le logo en image de fond de la page d'accueil 
class pageacceuil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: new Stack(
          children: <Widget>[
            //mettre un container afin de mieux gérer la mise en page 
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("images/Reminder.png"), fit: BoxFit.cover,),//importer l'image
              ),
            ),
          ],
        )
      );
   }
}

//créer un bouton qui permet de commencer la navigation dans l'application 
class commencer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(icon:Icon(Icons.menu),onPressed: (){

        }),
      title: Text("Reminder"),
      actions:<Widget>[
          IconButton(icon:Icon(Icons.menu),onPressed: (){
           }),
        ],
      ),
      body: Center(
        child: RaisedButton(
          child:Text('Liste des tâches',
          style: TextStyle(
            color: Colors.white,
          ),
          ),
          color: new Color(0xff622f74),
         onPressed: (){
            Navigator.push( context,
            MaterialPageRoute(builder:(context)=>Page_ELYAS()),// Elyas c'est ici que tu dois inclure ta page 
            );

          },
        )
      )
    );
  }
}


