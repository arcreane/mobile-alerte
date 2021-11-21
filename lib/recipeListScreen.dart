import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/recipe.dart';
import 'package:flutter_app/recipeBox.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'ma_page.dart';
import 'recipeformscreen.dart';

class RecipeListScreen extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
    return RecipeListScreenState();
  }
}

class RecipeListScreenState extends State<RecipeListScreen> {

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
                    MaterialPageRoute(builder:(context)=>RecipeFormScreen()),
                  );
                },
                label: const Text('Ajouter une tâche'),
                icon: const Icon(Icons.add_circle_outline),
                backgroundColor: Color(0xFF009075),
              ),

      body: ValueListenableBuilder(
        valueListenable : RecipeBox.box.listenable(),
        builder: (context, Box items, _) {
          List<String> keys = items.keys.cast<String>().toList();
            return ListView.builder(
              itemCount: keys.length,
              itemBuilder: (context, index){
                final recipe = items.get(keys[index]);
                return Dismissible(key: Key(recipe.title),
                    onDismissed: (direction){
                      setState(() {
                        RecipeBox.box.delete(recipe.key());
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${recipe.title} supprimé")));
                    },
                    background: Container(color: Color(0xFF009075)),
                    child: RecipeItemWidget(recipe: recipe));
              },
            );
          }
      ),
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

    )

    );
  }
}

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({Key key, @required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(
          context,
          '/recipe',
          arguments: recipe,
        );
      },

      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            Hero(
              tag: "imageRecipe" + recipe.title,
              child: CachedNetworkImage(
                imageUrl: recipe.imageUrl,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image(image: AssetImage("images/8061.jpg"),), //Icon(Icons.account_circle_rounded),
                width: 150,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(recipe.title,
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  Text(recipe.user,
                      style: TextStyle(color: Colors.grey[500], fontSize: 16))
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}

