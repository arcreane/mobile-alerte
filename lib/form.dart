import 'package:flutter/material.dart';


//classe pour afficher le formulaire

class formulaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Formulaire de tâche',
      debugShowCheckedModeBanner: false,// pour enlever le debug de flutter par defaut
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/fondd-2g.png"), fit: BoxFit.cover)),//image de background plein écran
        child: Scaffold(
          backgroundColor: Colors.transparent,//mettre transparent pour qu'il soit sur l'image de fond
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,// de même que pour scaffold
            title: Text('Formulaire de tâche',style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w600),),
            centerTitle: true,
            /*leading: IconButton(
                icon: Icon(
                  Icons.alarm,
                  color: (Colors.black),

                ),
                onPressed: () {}),*/
          ),
          body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 70.0),
          child: Form(
//            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                        logoimage(),// afficher l'image du logo, grace a la classe defini dans ce fichier 
                        SizedBox(height: 10.0),
                        TextFormField( // debut des button du formulaire 
                        decoration: InputDecoration(
                        labelText: 'Nom de la tâche',
                        border: OutlineInputBorder()
                        ),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                        decoration:  InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder()
                        ),
                        ),

                        SizedBox(height: 10.0),//permet de mettre les espaces

                        TextFormField(
                        decoration:  InputDecoration(
                        labelText: 'Date',
                        border: OutlineInputBorder()
                          ),
                        ),

                        SizedBox(height: 10.0),
                        TextFormField(
                        decoration: InputDecoration(
                        labelText: 'Heure',
                        border: OutlineInputBorder()
                        ),
                          obscureText: true,

                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 60.0, horizontal:20.0),
                        labelText: 'Adresse',
                        border: OutlineInputBorder()
                        ),

                        obscureText: true,
                        ),
                        SizedBox(height: 20.0),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
                             width: double.infinity,
                              child: FlatButton(
                                child: Text('Ajouter une tâche', style: TextStyle(fontSize: 22),textAlign: TextAlign.center ),
                                 onPressed: () => {},
                                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),//les bordeurs arrondi du buttons
                                    color: Color(0xFFcd9602),
                                     textColor: Colors.black,
                               ),
                          ),
                        ),
                ],


            ),
          ),


          ),

        ),
      ),

    );
  }

}

// class pour afficher le logo cloche
class logoimage extends StatelessWidget   {
  @override
  Widget build(BuildContext context) {

    AssetImage assetImage = AssetImage('images/fondd-2.png');
    Image image = Image(image: assetImage); //recuepre une image qui va prendre en parametre image
    return Container(child: image, width: 200.0, height: 200.0,  );
  }
}
