import 'package:applycelia/ma_page.dart';
import 'package:flutter/material.dart';
import 'page_elyas.dart';
class formulaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
//mettre le fond de la page
      title: 'Formulaire de tâche',
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/fondd-2g.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            //barre de navigation 
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Formulaire de tâche',style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w600),),
            centerTitle: true,
            //l'icone de retour arriere
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: (Colors.black),
                ),
              //clicker sur le bonton retour a la page précédente
                onPressed: () {
                  Navigator.push( context,
                    MaterialPageRoute(builder:(context)=>page_elyas()),
                  );
                }),
              ),
          // creer le formulaire
          body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 70.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                        logoimage(),
                        SizedBox(height: 10.0),
                        TextFormField(
                        decoration: InputDecoration(
                        //case nom de la tache 
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

                        SizedBox(height: 10.0),

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
                                 onPressed: () => {
                                   Navigator.push( context,
                                     MaterialPageRoute(builder:(context)=>page_elyas()),
                                   ),
                                 },
                                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
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
// class pour afficher le logo
class logoimage extends StatelessWidget   {
  @override
  Widget build(BuildContext context) {

    AssetImage assetImage = AssetImage('images/fondd-2.png');
    Image image = Image(image: assetImage); //recuepre une image qui va prendre en parametre image
    return Container(child: image, width: 200.0, height: 200.0,  );
  }
}
