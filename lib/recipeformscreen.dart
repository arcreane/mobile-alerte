import 'dart:math';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'recipeBox.dart';
import 'recipeListScreen.dart';
import 'recipe.dart';
import 'ma_page.dart';

class RecipeFormScreen extends StatefulWidget {
  @override
  _RecipeFormScreenState createState() => _RecipeFormScreenState();
}

class _RecipeFormScreenState extends State<RecipeFormScreen> {
  static const String IMAGE_URL = "FOND_01.png";
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final userController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [ //allows you to change the language and display another language
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('fr'),

        ],
        locale: Locale('fr'),
        debugShowCheckedModeBanner: false,
        home : Container(
            decoration: BoxDecoration( //allows you to put an image in the background of our application
                image: DecorationImage(
                    image: AssetImage("images/FOND_03.png"), fit: BoxFit.cover)),
    child: Scaffold(
      appBar: AppBar( //AppBar includes a Tool Bar and other potential Widgets
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Formulaire de tâche',style: TextStyle(color:  Color(0xFF009075), fontSize: 22.0, fontWeight: FontWeight.w600),),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
                Icons.arrow_back_ios,
                color:  Color(0xFF009075)

            ),
            onPressed: () {
              Navigator.push( context,
                MaterialPageRoute(builder:(context)=>RecipeListScreen()),
              );

            }),
      ),
      body: Form(
          key: formKey,
          child: ListView(
            children: [
              logoimage(),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: 'Nom de la tâche',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'entrer un Nom de la tâche';
                    }
                    return null;
                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  controller: userController,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.0)))),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mettre un nom ';
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                  child: Container(
                      child: DateTimePicker(
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.black45),
                          //errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                          suffixIcon: Icon(Icons.event_note),
                          labelText: 'date',
                        ),
                        initialValue: '',
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        dateLabelText: 'Date',
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      )
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                  child: Container(
                    child: DateTimeFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        //errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                        suffixIcon: Icon(Icons.access_time_filled),
                        labelText: 'Heure',

                      ),
                      mode: DateTimeFieldPickerMode.time,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                      onDateSelected: (DateTime value) {
                        print(value);
                      },

                    ),


                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 5,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Entrer une  description';
                    }
                    return null;
                  },
                ),
              ),



              SizedBox(height: 8.0),
              Align(// button ajouter tâche qui permet d'ajouter la tache de la page liste tâches
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  width: double.infinity,
                  child: FlatButton(
                    child: Text('Ajouter une tâche', style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),textAlign: TextAlign.center ),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        Recipe recipe = Recipe(
                            titleController.value.text,
                            userController.value.text,
                            IMAGE_URL,
                            descriptionController.value.text,
                            false,
                            new Random().nextInt(100),
                            DateTime.now(),
                        ),
                            date;

                        RecipeBox.box.put(recipe.key(), recipe);
                        Navigator.pop(context);
                      }
                    },
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xFF009075),
                    textColor: Colors.white,
                  ),
                ),
              ),
            ],
          )
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
                  MaterialPageRoute(builder:(context)=>RecipeListScreen()),
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

// class pour afficher le logo
class logoimage extends StatelessWidget   {
  @override
  Widget build(BuildContext context) {

    AssetImage assetImage = AssetImage('images/logo_reminder.png');
    Image image = Image(image: assetImage); //recuepre une image qui va prendre en parametre image
    return Container(child: image, width: 150.0, height: 150.0,  );
  }
}
