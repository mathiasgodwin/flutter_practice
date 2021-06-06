import 'package:flutter/material.dart';
import 'package:flutjoke/src/features/jokes/views/jokes_page.dart';

class FlutJokeApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes Demo',
      theme: ThemeData(  
      primarySwatch: Colors.deepPurple,
      ),
      home: JokesPage(),
    );
  }


}