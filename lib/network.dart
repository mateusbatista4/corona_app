import 'package:http/http.dart' as http;

class Service{
  static Future<String> getAPI() async{
    String url = 'http://corona.lmao.ninja/countries/';

    http.Response reponse = await http.get(Uri.encodeFull(url));
    return reponse.body;
  }
}
