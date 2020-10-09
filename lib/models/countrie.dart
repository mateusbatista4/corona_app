class CountrieInformations {
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

  CountrieInformations(
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

  CountrieInformations.fromJson(Map<String, dynamic> json) {
    print(json);
    updated = json['updated'];
    print("aq");
    country = json['country'];
    // countryInfo = json['countryInfo'] != null
    //     ? new CountryInfo.fromJson(json['countryInfo'])
    //     : null;
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
  int iId;
  String iso2;
  String iso3;
  int lat;
  int long;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['iso2'] = this.iso2;
    data['iso3'] = this.iso3;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['flag'] = this.flag;
    return data;
  }
}