import 'dart:ui';

import 'package:corona_check/models/country.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({Key key, this.country}) : super(key: key);
  final CountryInformations country;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        height: 50,
        margin: EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           
            CircleAvatar(
              radius: 30.0,
              
              child: Image.network(
                country.countryInfo.flag,
                fit: BoxFit.fill,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: Container(
                      margin: EdgeInsets.all(7),
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
              backgroundColor: Colors.transparent,
            ),
            Text(
              country.country,
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
            
          ],
        ),
      ),
    );
  }
}
