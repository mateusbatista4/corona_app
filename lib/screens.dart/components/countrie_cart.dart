import 'package:corona_check/models/countrie.dart';
import 'package:flutter/material.dart';

class CountrieCard extends StatelessWidget {
  const CountrieCard({Key key, this.countrie}) : super(key: key);
  final CountrieInformations countrie;
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
                    NetworkImage(countrie.countryInfo.flag),
                backgroundColor: Colors.transparent,
              ),
            
            Text(countrie.country)
          ],
        ),
      ),
    );
  }
}
