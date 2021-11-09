class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,// cela permet d'enlever le debug de l'application par defaut
      title: 'Reminder',//Titre de l'appli
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
      home: pageacceuil (),//inclure la page d'accueil "ma_page.dart"
    );
  }
}
