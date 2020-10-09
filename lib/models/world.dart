import 'package:flutter/cupertino.dart';

class World extends ChangeNotifier {
  num updated;
  num cases;
  num todayCases;
  num deaths;
  num todayDeaths;
  num recovered;
  num todayRecovered;
  num active;
  num critical;
  num casesPerOneMillion;
  num deathsPerOneMillion;
  num tests;
  num testsPerOneMillion;
  num population;
  num oneCasePerPeople;
  num oneDeathPerPeople;
  num oneTestPerPeople;
  num activePerOneMillion;
  num recoveredPerOneMillion;
  num criticalPerOneMillion;
  num affectedCountries;

  

  World.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    cases = json['cases'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    todayRecovered = json['todayRecovered'];
    active = json['active'];
    critical = json['critical'];
    casesPerOneMillion = json['casesPerOneMillion'];
    deathsPerOneMillion = json['deathsPerOneMillion'];
    tests = json['tests'];
    testsPerOneMillion = json['testsPerOneMillion'];
    population = json['population'];
    oneCasePerPeople = json['oneCasePerPeople'];
    oneDeathPerPeople = json['oneDeathPerPeople'];
    oneTestPerPeople = json['oneTestPerPeople'];
    activePerOneMillion = json['activePerOneMillion'];
    recoveredPerOneMillion = json['recoveredPerOneMillion'];
    criticalPerOneMillion = json['criticalPerOneMillion'];
    affectedCountries = json['affectedCountries'];
    print('foii');
  }
}
