import 'package:corona_check/models/countrie.dart';
import 'package:corona_check/models/network.dart';
import 'package:corona_check/screens.dart/components/countrie_cart.dart';
import 'package:corona_check/screens.dart/components/search_dialog.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/countrie.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Service>(
      builder: (_, service, __) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: service.search.isEmpty
                ? Text("COVID Tracker")
                : LayoutBuilder(
                    builder: (_, constrains) {
                      return InkWell(
                        splashColor: Theme.of(context).primaryColor,
                        onTap: () async {
                          final search = await showDialog<String>(
                            context: context,
                            builder: (_) => SearchDialog(
                              initialText: service.search,
                              search: (tx) {
                                service.search = tx;
                              },
                            ),
                          );
                          if (search != null) {
                            service.search = search;
                          }
                        },
                        child: Container(
                          width: constrains.biggest.width,
                          child: Center(
                            child: Text(
                              '${service.search}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () async {
                  final search = await showDialog<String>(
                    context: context,
                    builder: (_) => SearchDialog(
                      initialText: service.search,
                      search: (tx) {
                        service.search = tx;
                      },
                    ),
                  );
                  if (search != null) {
                    service.search = search;
                  }
                },
              )
            ],
          ),
          body: Container(
            child: service.countries.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      await service.getCoutriesList();
                      await Future.delayed(Duration(seconds: 3));
                    },
                    child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      itemCount: service.filteredCountrieInformationss.length,
                      itemBuilder: (_, index) => CountrieCard(
                          countrie:
                              service.filteredCountrieInformationss[index]),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
