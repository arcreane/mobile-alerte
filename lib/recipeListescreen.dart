
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'recipe.dart';
import 'package:mobilealerte/recipe.dart';
import 'package:mobilealerte/ListeRendez_vous.dart';
import 'form.dart';
import 'ma_page.dart';


class RecipeListScreen extends StatefulWidget{//Stateful Widgets are dynamic widgets. They can be updated during runtime based on user action or data change
  @override
  State<StatefulWidget> createState() {
    return RecipeListScreenState(
    );
  }

}

class RecipeListScreenState extends State<RecipeListScreen> {
  final List<Recipe> recipes = [ Recipe(
    "Docteur idir",
    "idir",
    "oishcihsdovinspvnpsonvposnvpozrnsgvposrnrvponrspovnrpsonvpronzvpornvopnerpnov",
  ),
    Recipe(
      "epssi",
      "idir",
      "yes",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
        decoration: BoxDecoration( //allows you to put an image in the background of our application
        image: DecorationImage(
        image: AssetImage("images/FOND_03.png"), fit: BoxFit.cover)),
    child: Scaffold(
      backgroundColor: Colors.transparent,
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
          MaterialPageRoute(builder:(context)=> pageacceuil()),
        );

        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push( context,
            MaterialPageRoute(builder:(context)=>formulaire()),
          );
        },
        label: const Text('Ajouter un rendez-vous'),
        icon: const Icon(Icons.add_circle_outline),
        backgroundColor: Color(0xFF009075),
      ),

      body: ListView.builder(

        itemCount: recipes.length,
        itemBuilder: (context, index){
          final recipe = recipes[index];
          return Dismissible(key: Key(recipe.title),
              onDismissed: (direction){
                setState(() {
                  recipes.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${recipe.title} supprimé")));
              },
              background: Container(color: Colors.red),
              child: RecipeListScreenWid(recipe: recipe));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(// pour afficher un footer dans notre application
        currentIndex: 0,
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



    ),
    ),
        );
  }
}




class  RecipeListScreenWid extends StatelessWidget {
  const RecipeListScreenWid({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
                builder:(context)=>Liste_Rendez_vous(recipe: recipe)
            ));
      },
      child: Card(
        margin: EdgeInsets.all(10),
        elevation:7,
        child: Row(
          children: [
            Icon(Icons.alarm_add),
            Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(recipe.title
                    )
                ),


                Text(recipe.user)
              ],
            )

          ],

        ),

      ),

    );

  }
}
