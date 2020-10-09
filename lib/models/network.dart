import 'dart:convert';

import 'package:corona_check/models/countrie.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Service extends ChangeNotifier {

  Service(){
    getCoutriesList();
  }

  List<CountrieInformations> countries = new List();

  Future<void> getCoutriesList() async {
    getAPI().then(
      (value) {
        var data = jsonDecode(value);
       print(data);
        for (var item in data) {
          countries.add(CountrieInformations.fromJson(item));
        }
        
        notifyListeners();
      },
      
    );
  }

  Future<String> getAPI() async {
    String url = 'https://corona.lmao.ninja/v3/covid-19/countries/';

    http.Response reponse = await http.get(Uri.encodeFull(url));
    return reponse.body;
  }
}
