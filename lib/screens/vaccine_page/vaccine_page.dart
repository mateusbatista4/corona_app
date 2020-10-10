

import 'package:corona_check/models/vaccine.dart';
import 'package:flutter/material.dart';

class VaccinePage extends StatelessWidget {
  const VaccinePage({Key key, this.vaccine}) : super(key: key);
  final VaccineStatus vaccine;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 90,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(right:15.0,left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "World Vaccines",
                      style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Nº of Candidates:  ${vaccine.totalCandidates}",
                      style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 10),
                    
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only( right: 40, left: 40,bottom: 20),
                child: Image.asset(
                  "assets/images/dna.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.only(right: 10, bottom: 7, left: 10),
                color: Colors.green[800],
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                          Text(
                            " Candidates:",
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ] +
                        [
                          SizedBox(
                            height: 6,
                          )
                        ] +
                        vaccine.phases
                            .map(
                              (e) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '- ${e.phase} :',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    '${e.candidates}',
                                    style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                  ),
                ),
              ),
              
            ] + vaccine.data.map((e) => Text(e.candidate)).toList(),
          ),
        ));
  }
}
