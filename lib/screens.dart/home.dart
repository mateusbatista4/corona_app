import 'package:corona_check/models/countrie.dart';
import 'package:corona_check/models/network.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/countrie.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("COVID Check"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.autorenew, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: Consumer<Service>(builder: (_, service, __) {
        return Container(
          child: service.countries.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  itemCount: service.countries.length,
                  itemBuilder: (_, index) =>
                      Text(service.countries[index].country),
                ),
        );
      }),
    );
  }
}
