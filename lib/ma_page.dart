//import 'package:applycelia/form.dart';
import 'package:flutter/material.dart';
import'page_elyas.dart';
class pageacceuil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(
              //mettre le backround
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("images/Reminder.png"), fit: BoxFit.cover,),
              ),
//creer le bonton commencer qui à pour role de nous orienter vers les autres pages afin d'executer les taches de l'application
            ),Align(
              alignment: Alignment.bottomCenter,//centrer les boutons
              child: Container(
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 40),//mettre les marges
              width: double.infinity,
              child: FlatButton(
              child: Text('Commencer', style: TextStyle(fontSize: 22),textAlign: TextAlign.center ),//nommer le bouton
              //clicker sur le bouton commencer
                onPressed: () => {
                //faire appel à la page suivante
                    Navigator.push( context,
                    MaterialPageRoute(builder:(context)=>page_elyas()),
                    ),
              },
                //mettre les formes arrondies au bouton et son style
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              color: Color(0xFFcd9602),
              textColor: Colors.black,
              ),
              )
            )
          ],
        )

    );

  }

}
