import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipeListescreen.dart';

// une nouvelle class
class Liste_Rendez_vous extends StatelessWidget {

  const Liste_Rendez_vous({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    Widget test  =             Container(
        padding: const EdgeInsets.all(10),
        child : Row(
          children : [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 9),
                  child : Text(recipe.title,
                      style: TextStyle(
                          fontWeight : FontWeight.bold,
                          fontSize: 35
                      )),
                ),
                Text(recipe.user,
                  style: TextStyle(color: Colors.red[500],fontSize: 25) ,
                )
              ],
            )
            ),
            Icon(Icons.alarm,color: Colors.red),
          ],
        ));


    //=======================
    Widget button =  Container(
      padding: const EdgeInsets.all(8),
      child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // pour laisser un espasse entre mes deux bouton
          children: [
            _cree_bouton(Colors.black,Icons.delete,"suprimer"),
            _cree_bouton(Colors.black,Icons.update,"moddefie")
          ]
      ),
    );
    //================================================
    Widget details = Container(
      padding: const EdgeInsets.all(32),
      child: Text(recipe.description,
        softWrap: true,
      ),
    );
    return Scaffold(
      appBar: AppBar( //AppBar includes a Tool Bar and other potential Widgets
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Ma Liste de tâche',style: TextStyle(color:  Color(0xFF009075), fontSize: 22.0, fontWeight: FontWeight.w600),),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
                Icons.arrow_back_ios,
                color:  Color(0xFF009075)

            ),
            onPressed: () {
              Navigator.push( context,
                MaterialPageRoute(builder:(context)=> RecipeListScreen()),
              );

            }),
      ),
        body: ListView(
            children : [
              Image.asset(
                'images/rendez-vous.jpg',
                width: 600,
                height: 350,
                fit: BoxFit.cover,
              ),
              test,
              button,
              details
            ]

        ),
      bottomNavigationBar: BottomNavigationBar(// pour afficher un footer dans notre application
        backgroundColor: Color(0xFF009075),
      selectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',


        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_alarms),
          label: 'Tâches',
          //backgroundColor: Colors.purple,
        ),

      ],


    ),

    );

  }

  // crée une nouvelle méthode qui crée  un boutton
  Column _cree_bouton(Color color , IconData icon, String test){
    return Column(
      children: [
        Container(   // pour bien séparée les information
          padding: const EdgeInsets.only(bottom: 8),
          child :
          Icon(icon, color : color),
        ),
        Text(test ,style: TextStyle(color:Color(0xFF009075),fontSize: 26),) // afficher le test avec un style personalisé
      ],
    );
  }
}
