import 'dart:convert';
import 'dart:html';

import 'package:corona_check/models/country.dart';
import 'package:flutter/material.dart';
import './home.dart';
import './network.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> lista = new List();

  void atualize()async{
    
      Service.getAPI().then((onValue){
        List<dynamic> data = jsonDecode(onValue);
        setState(() {
          data.forEach((val){
              
              lista.add(CountryInformations.fromJson(val));
          });
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.green,
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.green[800])),
      home: Scaffold(
        appBar:AppBar(
          centerTitle: true,
          title: Text("COVID Check"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.autorenew,color: Colors.white), onPressed: atualize,)  
            ], 
        ),
        body: Home(foo: lista,)
          
      )
    );
  }
}
