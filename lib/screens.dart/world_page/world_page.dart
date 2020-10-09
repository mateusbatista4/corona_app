import 'package:corona_check/models/world.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class WorldPage extends StatelessWidget {
  const WorldPage({Key key, this.world}) : super(key: key);
  final World world;
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
          height: MediaQuery.of(context).size.height,
          child: world != null
              ? Column(
                mainAxisSize: MainAxisSize.min,
                  children: [
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
                                Text(world.cases.toString(),
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
                                Text(world.deaths.toString(),
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
                                Text(world.todayCases.toString(),
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
                                Text(world.todayDeaths.toString(),
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
                                Text(world.active.toString(),
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 12))
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
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
