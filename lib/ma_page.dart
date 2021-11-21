
import 'package:flutter/material.dart';
import 'package:flutter_app/recipeListScreen.dart';



class pageacceuil extends StatelessWidget {
  @override//@override just points out that the function is also defined in an ancestor class
  Widget build(BuildContext context) {
    return Scaffold(//The Scaffold class is an extensible widget that fills the available space or screen
        body: new Stack(
          children: <Widget>[
            new Container(
              //mettre le backround
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("images/FOND_01.png"), fit: BoxFit.cover,),// importation de l'images dans l'Asset
              ),
//creer le bonton commencer qui à pour role de nous orienter vers les autres pages afin d'executer les taches de l'application
            ),
            Align(
                alignment: Alignment.bottomCenter,//centrer les boutons
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),//mettre les marges
                  width: double.infinity,
                  child: FlatButton(
                    child: Text('Commencer', style: TextStyle(color: Color(0xFF009075), fontSize: 18.0, fontWeight: FontWeight.normal),textAlign: TextAlign.center ),//nommer le bouton
                    //clicker sur le bouton commencer
                    onPressed: () => {
                      //faire appel à la page suivante
                      Navigator.push( context,
                        MaterialPageRoute(builder:(context)=>RecipeListScreen()),
                      ),
                    },
                    //mettre les formes arrondies au bouton et son style
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xFFFFFFFF),
                    textColor: Colors.black,
                  ),
                )
            )
          ],
        )

    );

  }

}
