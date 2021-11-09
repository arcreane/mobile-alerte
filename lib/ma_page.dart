//import'package:flutter/material.dart';
/*class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.amber,
        child: Text("Commencer", textDirection:TextDirection.ltr ,),
        width: 200.0,
        height: 40.0,
      )
    );
  }
}
class Reminder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =AssetImage('images/Reminder.png');
    Image image = Image(image: assetImage);
    return Container(child: image,);

  }
  Reminder();
}
*/
import 'package:flutter/material.dart';



class pageacceuil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(

              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("images/Reminder.png"), fit: BoxFit.cover,),
              ),
            ),

            /*new Center(
                  child: Center(child: logo(),),
                ),*/

          ],
        )

    );

  }

}



/*
class logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage ('images/fond-2.jpg');
    Image image = Image(image: assetImage);
    return Container( child: image, width: 200,height: 200,alignment: Alignment.center,);
  }
}*/
class commencer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(icon:Icon(Icons.menu),onPressed: (){

        }),
      title: Text("Reminder"),
      actions:<Widget>[
          IconButton(icon:Icon(Icons.menu),onPressed: (){
           }),
        ],
      ),
      body: Center(
        child: RaisedButton(
          child:Text('Liste des tâches',
          style: TextStyle(
            color: Colors.white,
          ),
          ),
          color: new Color(0xff622f74),
          onPressed: (){

          },
        )
      )
    );
  }
}

