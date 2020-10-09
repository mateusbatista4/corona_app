import 'dart:convert';
import 'dart:ffi';

import 'package:corona_check/models/country.dart';
import 'package:corona_check/models/vaccine.dart';
import 'package:corona_check/models/world.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Service extends ChangeNotifier {
  Service() {
    getWorldData();
    getVaccineData();
    getCoutriesList();
    
  }

  World world;

  VaccineStatus vaccineData;

  List<CountryInformations> countries = [];

  String _search = '';

  String get search => _search;

  set search(String value) {
    _search = value;
    notifyListeners();
  }

  void setSearch(value) {
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
          (c) => c.country.toLowerCase().contains(
                search.toLowerCase(),
              ),
        ),
      );
    }

    return filteredCountryInformationss;
  }

  Future<void> getWorldData() async {
    _getAPI('https://disease.sh/v3/covid-19/all').then(
      (value) {
        var data = jsonDecode(value);
        world = World.fromJson(data);
        notifyListeners();
      },
    );
  }

  Future<void> getVaccineData() async {
    _getAPI('https://disease.sh/v3/covid-19/vaccine').then((value) {
      var data = jsonDecode(value);
      vaccineData = VaccineStatus.fromJson(data);
      notifyListeners();
    });
  }

  Future<void> getCoutriesList() async {
    _getAPI('https://corona.lmao.ninja/v3/covid-19/countries/').then(
      (value) {
        var data = jsonDecode(value);
        for (var item in data) {
          countries.add(CountryInformations.fromJson(item));
        }
        notifyListeners();
      },
    );
  }

  Future<String> _getAPI(String url) async {
    http.Response reponse = await http.get(Uri.encodeFull(url));
    return reponse.body;
  }
}
