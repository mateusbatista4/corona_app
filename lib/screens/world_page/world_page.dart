


import 'package:corona_check/models/network.dart';
import 'package:corona_check/screens.dart/world_page/components/country_card.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class WorldPage extends StatelessWidget {
  const WorldPage({Key key, this.service}) : super(key: key);
  final Service service;
  @override
  Widget build(BuildContext context) {
    return SlidingSheet(
      color: Colors.green[800],
      cornerRadius: 22,
      snapSpec: const SnapSpec(
        // Enable snapping. This is true by default.
        snap: false,
        // Set custom snapping points.
        snappings: [0.45, 0.85],

        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 110, right: 40, left: 40),
        child: Image.asset(
          "assets/images/world_connection__monochromatic.png",
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 30, right: 10, left: 10),
          height: MediaQuery.of(context).size.height*2,
          child: service.world != null
              ? Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                "Total Cases:",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 20),
                              ),
                              Text(service.world.cases.toString(),
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15))
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                "Total Deaths:",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 20),
                              ),
                              Text(service.world.deaths.toString(),
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: EdgeInsets.all(5),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                "Today Cases:",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                              Text(service.world.todayCases.toString(),
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 14))
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: EdgeInsets.all(5),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                "Today Deaths:",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                              Text(service.world.todayDeaths.toString(),
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 14))
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: EdgeInsets.all(5),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                "Active:",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                              Text(service.world.active.toString(),
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 12))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Countries   ',style: TextStyle(
                                            color: Colors.white, fontSize: 26)),
                          Icon(Icons.arrow_downward_outlined,color: Colors.white,)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        children: service.filteredCountryInformationss
                            .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CountryCard(country: e),
                            ))
                            .toList(),
                      ),
                    ),
                  )
                ])
              : Column(
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white10,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
