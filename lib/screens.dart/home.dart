import 'package:corona_check/models/network.dart';
import 'package:corona_check/screens.dart/world_page/components/country_card.dart';
import 'package:corona_check/screens.dart/world_page/components/search_dialog.dart';
import 'package:corona_check/screens.dart/world_page/world_page.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  

  Widget content(context, Service service, int index){
    List<Widget> widgets = [
    WorldPage(service: service),
  ];
    return widgets[index];
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<Service>(
      builder: (_, service, __) {
        return Scaffold(
          extendBodyBehindAppBar: true,
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
          body: content(context, service, selectedIndex),
          bottomNavigationBar: FFNavigationBar(
            theme: FFNavigationBarTheme(
              barBackgroundColor: Colors.white,
              selectedItemBackgroundColor: Colors.green[800],
              selectedItemIconColor: Colors.white,
              selectedItemLabelColor: Colors.black,
            ),
            selectedIndex: selectedIndex,
            onSelectTab: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              FFNavigationBarItem(
                iconData: Icons.public,
                label: 'World',
              ),
              FFNavigationBarItem(
                iconData: Icons.location_on,
                label: 'Location',
              ),
              FFNavigationBarItem(
                iconData: Icons.coronavirus,
                label: 'Vaccine',
              ),
              FFNavigationBarItem(
                iconData: Icons.masks,
                label: 'Advices',
              ),
              FFNavigationBarItem(
                iconData: Icons.settings,
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
