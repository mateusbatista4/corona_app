
import 'package:corona_check/models/country.dart';

import 'package:flutter/material.dart';

import './models/country.dart';

class Home extends StatefulWidget {
    final List<CountryInformations> foo;

  const Home({Key key, this.foo}): super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[
           Container(
             width: double.infinity,
             child: Card(
               color: Colors.green[300],
               child: Text("grafico"),
             ),
             ),
            Column(
              children: widget.foo.isNotEmpty  ? widget.foo.map((country) {
                                      
                    return Card(
                      child: Text(country.coutryName),);
                  }).toList() : [Text("Network ERRO")],
              
            )

         ],
       ),
    );
  }
}