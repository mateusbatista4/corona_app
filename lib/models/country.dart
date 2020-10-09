class CountryInformations {
  num updated;
  String country;
  CountryInfo countryInfo;
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
  String continent;
  num oneCasePerPeople;
  num oneDeathPerPeople;
  num oneTestPerPeople;
  num activePerOneMillion;
  num recoveredPerOneMillion;
  num criticalPerOneMillion;

  CountryInformations(
      {this.updated,
      this.country,
      this.countryInfo,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.tests,
      this.testsPerOneMillion,
      this.population,
      this.continent,
      this.oneCasePerPeople,
      this.oneDeathPerPeople,
      this.oneTestPerPeople,
      this.activePerOneMillion,
      this.recoveredPerOneMillion,
      this.criticalPerOneMillion});

  CountryInformations.fromJson(Map<String, dynamic> json) {
    print(json);
    updated = json['updated'];
    print("aq");
    country = json['country'];
    countryInfo = CountryInfo.fromJson(json['countryInfo']);
        
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
    continent = json['continent'];
    oneCasePerPeople = json['oneCasePerPeople'];
    oneDeathPerPeople = json['oneDeathPerPeople'];
    oneTestPerPeople = json['oneTestPerPeople'];
    activePerOneMillion = json['activePerOneMillion'];
    recoveredPerOneMillion = json['recoveredPerOneMillion'];
    criticalPerOneMillion = json['criticalPerOneMillion'];
  }

  
}

class CountryInfo {
  num iId;
  String iso2;
  String iso3;
  num lat;
  num long;
  String flag;

  CountryInfo({this.iId, this.iso2, this.iso3, this.lat, this.long, this.flag});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    lat = json['lat'];
    long = json['long'];
    flag = json['flag'];
  }

  
}