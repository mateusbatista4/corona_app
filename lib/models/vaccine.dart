class VaccineStatus {
  String source;
  String totalCandidates;
  List<Phases> phases;
  List<Data> data;

  VaccineStatus({this.source, this.totalCandidates, this.phases, this.data});

  VaccineStatus.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    totalCandidates = json['totalCandidates'];
    if (json['phases'] != null) {
      phases = new List<Phases>();
      json['phases'].forEach((v) {
        phases.add(new Phases.fromJson(v));
      });
    }
    
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  
}

class Phases {
  String phase;
  String candidates;

  Phases({this.phase, this.candidates});

  Phases.fromJson(Map<String, dynamic> json) {
    phase = json['phase'];
    candidates = json['candidates'];
  }

  
}

class Data {
  String candidate;
  String mechanism;
  List<String> sponsors;
  String details;
  String trialPhase;
  List<String> institutions;

  Data(
      {this.candidate,
      this.mechanism,
      this.sponsors,
      this.details,
      this.trialPhase,
      this.institutions});

  Data.fromJson(Map<String, dynamic> json) {
    candidate = json['candidate'];
    mechanism = json['mechanism'];
    sponsors = json['sponsors'].cast<String>();
    
    details = json['details'];
    trialPhase = json['trialPhase'];
    institutions = json['institutions'].cast<String>();
  }

}