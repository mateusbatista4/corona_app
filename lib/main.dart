import 'package:corona_check/models/network.dart';
import 'package:corona_check/models/world.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens.dart/home.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Service(),
          lazy: false,
        ),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.green[800],
        title: "Corona App",
        theme: ThemeData(
          primaryColor:  Colors.green[800] ,
          fontFamily: 'Google',
        brightness: Brightness.light,
          appBarTheme: AppBarTheme(color: Colors.green[800]),
        ),
        home: Home(),
      ),
    );
  }
}
