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
                image: AssetImage("images/FOND_03.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Liste des tâches', style: TextStyle(
                color:  Color(0xFF009075),
                fontSize: 22.0,
                fontWeight: FontWeight.w600),),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                    color:  Color(0xFF009075)

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
                          horizontal: 30, vertical: 40),
                      width: double.infinity,
                      child: FlatButton(
                        child: Text('afficher les listes', style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                        onPressed: () =>
                        {
                          Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => formulaire()),
                          ),

                        },

                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Color(0xFF009075),
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                ],


              ),
            ),


          ),
          bottomNavigationBar: BottomNavigationBar(
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





