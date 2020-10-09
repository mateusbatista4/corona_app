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
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        height: 50,
        margin: EdgeInsets.all(6),
        child: Row(
          children: [
            CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    NetworkImage(country.countryInfo.flag),
                backgroundColor: Colors.transparent,
              ),
            
            Text(country.country)
          ],
        ),
      ),
    );
  }
}
