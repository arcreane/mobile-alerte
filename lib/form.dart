
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.Dart';
import 'recipeListescreen.dart';

class formulaire extends StatelessWidget {
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

      title: 'Formulaire de tâche',
      debugShowCheckedModeBanner: false, //// this allows you to remove the debug banner
      home: Container(
        decoration: BoxDecoration( //allows you to put an image in the background of our application
            image: DecorationImage(
                image: AssetImage("images/FOND_03.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
          body: SingleChildScrollView( // A box in which a single widget can scroll. This widget is useful when you have a single box that will normally be fully visible, for example a clock face in a time picker
          padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 70.0),
          child: Form(
//            key: _keyForm,
            child: Column( //Column is a widget that displays its child widgets on a column
              crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                        logoimage(),// fonction qui permet d'afficher le logo on haut de la page
                        SizedBox(height: 10.0),
                        SizedBox(height: 10.0),
                        TextFormField( //  afficher les cases de texte
                        decoration: InputDecoration(
                        labelText: 'Nom de la tâche',
                        border: OutlineInputBorder(
                        )
                        ),

                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                        decoration:  InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder()
                        ),
                        ),

                  SizedBox(height: 10.0),

                  SizedBox(height: 10.0),

                  Align( // mon button date
                      child: Container(
                          child: DateTimePicker(
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.black45),
                              //errorStyle: TextStyle(color: Colors.redAccent),
                              border: OutlineInputBorder(
                              ),
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
                  SizedBox(height: 10.0),
                  SizedBox(height: 10.0),

                  Align(// mon button heure
                      child: Container(
                        child: DateTimeFormField(
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.black45),
                            //errorStyle: TextStyle(color: Colors.redAccent),
                            border: OutlineInputBorder(),
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


                      )
                  ),

                  SizedBox(height: 10.0),
                        TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 60.0, horizontal:20.0),
                        labelText: 'Adresse',
                        border: OutlineInputBorder()
                        ),

                        
                        ),
                        SizedBox(height: 20.0),

                        Align(// button ajouter tâche qui permet d'ajouter la tache de la page liste tâches
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                             width: double.infinity,
                              child: FlatButton(
                                child: Text('Ajouter une tâche', style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),textAlign: TextAlign.center ),
                                 onPressed: () => {
                                   Navigator.push( context,
                                     MaterialPageRoute(builder:(context)=>RecipeListScreen()),
                                   ),
                                 },
                                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                    color: Color(0xFF009075),
                                     textColor: Colors.white,
                               ),
                          ),
                        ),

                ],


            ),

          ),

// la partie footer de l'aaplication
          ),

          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xFF009075),
            selectedItemColor: Colors.white,
            items:  [
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

// class pour afficher le logo
class logoimage extends StatelessWidget   {
  @override
  Widget build(BuildContext context) {

    AssetImage assetImage = AssetImage('images/logo_reminder.png');
    Image image = Image(image: assetImage); //recuepre une image qui va prendre en parametre image
    return Container(child: image, width: 150.0, height: 150.0,  );
  }
}


