
import 'package:flutter/material.dart';
import'page_elyas.dart';
class pageacceuil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(

              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("images/Reminder.png"), fit: BoxFit.cover,),
              ),

            ),
            //creation du bouton de démarrage
            Padding(
              padding: EdgeInsets.only(left: 200.0, right: 0.0,top:550.0),//caractéristiques de mise en page du bouton
              child: RaisedButton(
                  textColor: Colors.white,//couleur du teexte dans le bouton
                  color: Colors.deepPurpleAccent, // couleur de fond du bouton
                  child: Text("Commencer"),
                  onPressed: () {
                    Navigator.push( context,
                      MaterialPageRoute(builder:(context)=>page_elyas()),// Elyas c'est ici que tu dois inclure ta page
                    );

                  },
                  shape: new RoundedRectangleBorder(//mettre les bords du bouton en arrondi
                      borderRadius: new BorderRadius.circular(80.0))),
            )
          ],
        )

    );

  }

}


