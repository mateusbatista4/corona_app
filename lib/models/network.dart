import 'dart:convert';

import 'package:corona_check/models/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Service extends ChangeNotifier {

  Service(){
    getCoutriesList();
  }

  List<CountryInformations> countries = [];
  
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


  List<CountryInformations> get filteredCountryInformationss {
    List<CountryInformations> filteredCountryInformationss = [];
    if (search.isEmpty) {
      filteredCountryInformationss.addAll(countries);
    } else {
      filteredCountryInformationss.addAll(
        countries.where(
          (c) => c.country.toLowerCase().contains(search.toLowerCase(),),
        ),
      );
    }
    
    return filteredCountryInformationss;
    
  }

  Future<void> getCoutriesList() async {
    _getAPI().then(
      (value) {
        var data = jsonDecode(value);
       print(data);
        for (var item in data) {
          countries.add(CountryInformations.fromJson(item));
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
