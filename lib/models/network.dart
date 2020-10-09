import 'dart:convert';

import 'package:corona_check/models/countrie.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Service extends ChangeNotifier {

  Service(){
    getCoutriesList();
  }

  List<CountrieInformations> countries = [];
  
  String _search = '';

  String get search => _search;

  set search(String value) {
    _search = value;
    notifyListeners();
    
  }

  void setSearch(value){
    _search = value;
    notifyListeners();
  }


  List<CountrieInformations> get filteredCountrieInformationss {
    List<CountrieInformations> filteredCountrieInformationss = [];
    if (search.isEmpty) {
      filteredCountrieInformationss.addAll(countries);
    } else {
      filteredCountrieInformationss.addAll(
        countries.where(
          (c) => c.country.toLowerCase().contains(search.toLowerCase(),),
        ),
      );
    }
    
    return filteredCountrieInformationss;
    
  }

  Future<void> getCoutriesList() async {
    _getAPI().then(
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

  Future<String> _getAPI() async {
    String url = 'https://corona.lmao.ninja/v3/covid-19/countries/';

    http.Response reponse = await http.get(Uri.encodeFull(url));
    return reponse.body;
  }
}
