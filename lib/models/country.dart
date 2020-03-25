class CountryInformations {
  String coutryName;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
 int recovered;
  int active;
  int critical;
  int casesPerOneMillion;

  CountryInformations(
    {this.coutryName,this.cases,
    this.todayCases,this.deaths,this.todayDeaths,
    this.recovered,this.active,
    this.critical,this.casesPerOneMillion}
  );


  factory CountryInformations.fromJson(Map<String, dynamic> json){
    print("ok");
    return CountryInformations(
      coutryName: json['country'],
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      todayDeaths: json['todayDeaths'],
      recovered: json['recovered'],
      active: json['active'],
      critical: json['critical'],
      casesPerOneMillion: json['casesPerOneMillion'],

    );
  }

}