import 'package:flutter/material.dart';
import 'alarm.dart';
import 'favoriteChangeNotifier.dart';
import 'package:provider/provider.dart';
import 'recipe.dart';
import 'recipeListScreen.dart';
import 'ma_page.dart';
import 'recipeformscreen.dart';


class RecipeScreen extends StatelessWidget {
  const RecipeScreen({Key key, @required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
        padding: const EdgeInsets.all(8),
        child: Row(

          children: [
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child:
                      Text(recipe.title,
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                          ),
                    Text(recipe.user,
                        style: TextStyle(color: Colors.grey[500], fontSize: 16)),
                    IconButton (
                        icon: Icon(Icons.alarm,color: Colors.red),
                        onPressed: () {
                          Navigator.push( context,
                            MaterialPageRoute(builder:(context)=> MyHomePage()),
                          );
                        }
                    ),
                         ],
                       )),
                      ],
                    ));

    Widget buttonSection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        _buildButtonColumn(Color(0xFF009075), Icons.assignment_turned_in_outlined, "supprimer"),
        _buildButtonColumn(Colors.black, Icons.cancel_outlined, "modifier"),

      ]),


    );

    Widget descriptionSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        recipe.description,
        softWrap: true,
      ),
    );
    return ChangeNotifierProvider(
      create: (context)=> FavoriteChangeNotifier(recipe),
      child: Scaffold(
          appBar: AppBar(
            //AppBar includes a Tool Bar and other potential Widgets
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Details de tâche',style: TextStyle(color:  Color(0xFF009075), fontSize: 22.0, fontWeight: FontWeight.w600),),
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
              children: [
                Image.asset(
                  'images/rendez-vous.jpg',
                  width: 600,
                  height: 350,
                  fit: BoxFit.cover,
                ),
                titleSection,
                buttonSection,
                descriptionSection,
              ]),
        bottomNavigationBar: new BottomAppBar(
          color: Color(0xFF009075),
            child: new Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
        onPressed: () {
          Navigator.push( context,
            MaterialPageRoute(builder:(context)=>pageacceuil()),
          );
        },
       ),
    new Expanded(child: new SizedBox()),
    IconButton(
    icon: Icon(
    Icons.add,
    color: Colors.white,
    ),
    onPressed: () {
      Navigator.push( context,
        MaterialPageRoute(builder:(context)=>RecipeFormScreen()),
        );
       },
      ),
     ],
    ),
  ),
 )
);
}

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Icon(icon, color: color)),
        Text(label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: color,
            ))
           ],
          );
         }
        }
