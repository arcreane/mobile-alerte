import 'form.dart';
import 'package:flutter/material.dart';
import 'ma_page.dart';


class page_elyas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(

      title: 'Liste des tâches',
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/fondd-2g.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Liste des tâches', style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.w600),),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: (Colors.black),

                ),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => pageacceuil()),
                  );
                }),
          ),

          body: SingleChildScrollView(

            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 70.0),
            child: Form(
//            key: _keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 50, vertical: 40),
                      width: double.infinity,
                      child: FlatButton(
                        child: Text('afficher les listes', style: TextStyle(
                            fontSize: 22), textAlign: TextAlign.center),
                        onPressed: () =>
                        {
                          Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => formulaire()),
                          ),

                        },

                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Color(0xFFcd9602),
                        textColor: Colors.black,
                      ),
                    ),
                  ),
                ],


              ),
            ),


          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            backgroundColor: Color(0xFFcd9602),
            selectedItemColor: Colors.black,
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



