class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,// sa permet d'enlever le debug de l'application par defaut
      title: 'Reminder',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
      home: pageacceuil (),
    );
  }
}
